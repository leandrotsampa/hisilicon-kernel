/*
 * drivers/base/sync.c
 *
 * Copyright (C) 2012 Google, Inc.
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#include <linux/debugfs.h>
#include <linux/export.h>
#include <linux/file.h>
#include <linux/fs.h>
#include <linux/kernel.h>
#include <linux/poll.h>
#include <linux/sched.h>
#include <linux/seq_file.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/anon_inodes.h>

#include "sync.h"

static const struct fence_ops android_fence_ops;
static const struct file_operations sync_fence_fops;

struct sync_timeline *hi_sync_timeline_create(const struct sync_timeline_ops *ops,
					   int size, const char *name)
{
	struct sync_timeline *obj;

	if (size < sizeof(struct sync_timeline))
		return NULL;

	obj = kzalloc(size, GFP_KERNEL);
	if (obj == NULL)
		return NULL;

	kref_init(&obj->kref);
	obj->ops = ops;
	obj->context = fence_context_alloc(1);
	strlcpy(obj->name, name, sizeof(obj->name));

	INIT_LIST_HEAD(&obj->child_list_head);
	INIT_LIST_HEAD(&obj->active_list_head);
	spin_lock_init(&obj->child_list_lock);

	return obj;
}
EXPORT_SYMBOL(hi_sync_timeline_create);

static void sync_timeline_free(struct kref *kref)
{
	struct sync_timeline *obj =
		container_of(kref, struct sync_timeline, kref);

	if (obj->ops->release_obj)
		obj->ops->release_obj(obj);

	kfree(obj);
}

static void sync_timeline_get(struct sync_timeline *obj)
{
	kref_get(&obj->kref);
}

static void sync_timeline_put(struct sync_timeline *obj)
{
	kref_put(&obj->kref, sync_timeline_free);
}

void hi_sync_timeline_destroy(struct sync_timeline *obj)
{
	obj->destroyed = true;
	/*
	 * Ensure timeline is marked as destroyed before
	 * changing timeline's fences status.
	 */
	smp_wmb();

	/*
	 * signal any children that their parent is going away.
	 */
	hi_sync_timeline_signal(obj);
	sync_timeline_put(obj);
}
EXPORT_SYMBOL(hi_sync_timeline_destroy);

void hi_sync_timeline_signal(struct sync_timeline *obj)
{
	unsigned long flags;
	LIST_HEAD(signaled_pts);
	struct sync_pt *pt, *next;

	spin_lock_irqsave(&obj->child_list_lock, flags);

	list_for_each_entry_safe(pt, next, &obj->active_list_head,
				 active_list) {
		if (fence_is_signaled_locked(&pt->base))
			list_del_init(&pt->active_list);
	}

	spin_unlock_irqrestore(&obj->child_list_lock, flags);
}
EXPORT_SYMBOL(hi_sync_timeline_signal);

struct sync_pt *hi_sync_pt_create(struct sync_timeline *obj, int size)
{
	unsigned long flags;
	struct sync_pt *pt;

	if (size < sizeof(struct sync_pt))
		return NULL;

	pt = kzalloc(size, GFP_KERNEL);
	if (pt == NULL)
		return NULL;

	spin_lock_irqsave(&obj->child_list_lock, flags);
	sync_timeline_get(obj);
	fence_init(&pt->base, &android_fence_ops, &obj->child_list_lock,
		   obj->context, ++obj->value);
	list_add_tail(&pt->child_list, &obj->child_list_head);
	INIT_LIST_HEAD(&pt->active_list);
	spin_unlock_irqrestore(&obj->child_list_lock, flags);
	return pt;
}
EXPORT_SYMBOL(hi_sync_pt_create);

void hi_sync_pt_free(struct sync_pt *pt)
{
	fence_put(&pt->base);
}
EXPORT_SYMBOL(hi_sync_pt_free);


static const char *android_fence_get_driver_name(struct fence *fence)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);

	return parent->ops->driver_name;
}

static const char *android_fence_get_timeline_name(struct fence *fence)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);

	return parent->name;
}

static void android_fence_release(struct fence *fence)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);
	unsigned long flags;

	spin_lock_irqsave(fence->lock, flags);
	list_del(&pt->child_list);
	if (WARN_ON_ONCE(!list_empty(&pt->active_list)))
		list_del(&pt->active_list);
	spin_unlock_irqrestore(fence->lock, flags);

	if (parent->ops->free_pt)
		parent->ops->free_pt(pt);

	sync_timeline_put(parent);
	fence_free(&pt->base);
}

static bool android_fence_signaled(struct fence *fence)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);
	int ret;

	ret = parent->ops->has_signaled(pt);
	if (ret < 0)
		fence->status = ret;
	return ret;
}

static bool android_fence_enable_signaling(struct fence *fence)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);

	if (android_fence_signaled(fence))
		return false;

	list_add_tail(&pt->active_list, &parent->active_list_head);
	return true;
}

static void android_fence_disable_signaling(struct fence *fence)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);

	list_del_init(&pt->active_list);
}

static int android_fence_fill_driver_data(struct fence *fence,
					  void *data, int size)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);

	if (!parent->ops->fill_driver_data)
		return 0;
	return parent->ops->fill_driver_data(pt, data, size);
}

static void android_fence_value_str(struct fence *fence,
				    char *str, int size)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);

	if (!parent->ops->pt_value_str) {
		if (size)
			*str = 0;
		return;
	}
	parent->ops->pt_value_str(pt, str, size);
}

static void android_fence_timeline_value_str(struct fence *fence,
					     char *str, int size)
{
	struct sync_pt *pt = container_of(fence, struct sync_pt, base);
	struct sync_timeline *parent = sync_pt_parent(pt);

	if (!parent->ops->timeline_value_str) {
		if (size)
			*str = 0;
		return;
	}
	parent->ops->timeline_value_str(parent, str, size);
}

static const struct fence_ops android_fence_ops = {
	.get_driver_name = android_fence_get_driver_name,
	.get_timeline_name = android_fence_get_timeline_name,
	.enable_signaling = android_fence_enable_signaling,
	.disable_signaling = android_fence_disable_signaling,
	.signaled = android_fence_signaled,
	.wait = fence_default_wait,
	.release = android_fence_release,
	.fill_driver_data = android_fence_fill_driver_data,
	.fence_value_str = android_fence_value_str,
	.timeline_value_str = android_fence_timeline_value_str,
};
