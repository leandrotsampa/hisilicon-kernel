#include <linux/file.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/slab.h>
#include <linux/sync_file.h>

#include "hi_sync_debug.h"


struct sw_sync_create_fence_data {
	__u32	value;
	char	name[32];
	__s32	fence; /* fd of new fence */
};

static const struct fence_ops timeline_fence_ops;

static inline struct hi_sync_pt *fence_to_sync_pt(struct fence *fence)
{
	if (fence->ops != &timeline_fence_ops)
		return NULL;
	return container_of(fence, struct hi_sync_pt, base);
}

/**
 * hi_sync_timeline_create() - creates a sync object
 * @name:	hi_sync_timeline name
 *
 * Creates a new hi_sync_timeline. Returns the hi_sync_timeline object or NULL in
 * case of error.
 */
struct hi_sync_timeline *hi_sync_timeline_create(const char *name)
{
	struct hi_sync_timeline *obj;

	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
	if (!obj)
		return NULL;

	kref_init(&obj->kref);
	obj->context = fence_context_alloc(1);
	strlcpy(obj->name, name, sizeof(obj->name));

	INIT_LIST_HEAD(&obj->child_list_head);
	INIT_LIST_HEAD(&obj->active_list_head);
	spin_lock_init(&obj->child_list_lock);

	return obj;
}

void hi_sync_timeline_free(struct kref *kref)
{
	struct hi_sync_timeline *obj =
		container_of(kref, struct hi_sync_timeline, kref);

	kfree(obj);
}

static void hi_sync_timeline_get(struct hi_sync_timeline *obj)
{
	kref_get(&obj->kref);
}

static void hi_sync_timeline_put(struct hi_sync_timeline *obj)
{
	kref_put(&obj->kref, hi_sync_timeline_free);
}

/**
 * hi_sync_timeline_signal() - signal a status change on a hi_sync_timeline
 * @obj:	hi_sync_timeline to signal
 * @inc:	num to increment on timeline->value
 *
 * A sync implementation should call this any time one of it's fences
 * has signaled or has an error condition.
 */
void hi_sync_timeline_signal(struct hi_sync_timeline *obj, unsigned int inc)
{
	unsigned long flags;
	struct hi_sync_pt *pt, *next;

	spin_lock_irqsave(&obj->child_list_lock, flags);

	obj->value += inc;

	list_for_each_entry_safe(pt, next, &obj->active_list_head,
				 active_list) {
		if (fence_is_signaled_locked(&pt->base))
			list_del_init(&pt->active_list);
	}

	spin_unlock_irqrestore(&obj->child_list_lock, flags);
}

void hi_sync_timeline_destroy(struct hi_sync_timeline *obj)
{
	smp_wmb();
	hi_sync_timeline_put(obj);
}

/**
 * hi_sync_pt_create() - creates a sync pt
 * @parent:	fence's parent hi_sync_timeline
 * @size:	size to allocate for this pt
 * @inc:	value of the fence
 *
 * Creates a new hi_sync_pt as a child of @parent.  @size bytes will be
 * allocated allowing for implementation specific data to be kept after
 * the generic hi_sync_timeline struct. Returns the hi_sync_pt object or
 * NULL in case of error.
 */
struct hi_sync_pt *hi_sync_pt_create(struct hi_sync_timeline *obj, int size,
			     unsigned int value)
{
	unsigned long flags;
	struct hi_sync_pt *pt;

	if (size < sizeof(*pt))
		return NULL;

	pt = kzalloc(size, GFP_KERNEL);
	if (!pt)
		return NULL;

	spin_lock_irqsave(&obj->child_list_lock, flags);
	hi_sync_timeline_get(obj);
	fence_init(&pt->base, &timeline_fence_ops, &obj->child_list_lock,
		   obj->context, value);
	list_add_tail(&pt->child_list, &obj->child_list_head);
	INIT_LIST_HEAD(&pt->active_list);
	spin_unlock_irqrestore(&obj->child_list_lock, flags);
	return pt;
}

static const char *timeline_fence_get_driver_name(struct fence *fence)
{
	return "hi_sync";
}

static const char *timeline_fence_get_timeline_name(struct fence *fence)
{
	struct hi_sync_timeline *parent = fence_parent(fence);

	return parent->name;
}

static void timeline_fence_release(struct fence *fence)
{
	struct hi_sync_pt *pt = fence_to_sync_pt(fence);
	struct hi_sync_timeline *parent = fence_parent(fence);
	unsigned long flags;

	spin_lock_irqsave(fence->lock, flags);
	list_del(&pt->child_list);
	if (!list_empty(&pt->active_list))
		list_del(&pt->active_list);
	spin_unlock_irqrestore(fence->lock, flags);

	hi_sync_timeline_put(parent);
	fence_free(fence);
}

static bool timeline_fence_signaled(struct fence *fence)
{
	struct hi_sync_timeline *parent = fence_parent(fence);

	return (fence->seqno > parent->value) ? false : true;
}

static bool timeline_fence_enable_signaling(struct fence *fence)
{
	struct hi_sync_pt *pt = fence_to_sync_pt(fence);
	struct hi_sync_timeline *parent = fence_parent(fence);

	if (timeline_fence_signaled(fence))
		return false;

	list_add_tail(&pt->active_list, &parent->active_list_head);
	return true;
}

static void timeline_fence_disable_signaling(struct fence *fence)
{
	struct hi_sync_pt *pt = container_of(fence, struct hi_sync_pt, base);

	list_del_init(&pt->active_list);
}

static void timeline_fence_value_str(struct fence *fence,
				    char *str, int size)
{
	snprintf(str, size, "%d", fence->seqno);
}

static void timeline_fence_timeline_value_str(struct fence *fence,
					     char *str, int size)
{
	struct hi_sync_timeline *parent = fence_parent(fence);

	snprintf(str, size, "%d", parent->value);
}

static const struct fence_ops timeline_fence_ops = {
	.get_driver_name = timeline_fence_get_driver_name,
	.get_timeline_name = timeline_fence_get_timeline_name,
	.enable_signaling = timeline_fence_enable_signaling,
	.disable_signaling = timeline_fence_disable_signaling,
	.signaled = timeline_fence_signaled,
	.wait = fence_default_wait,
	.release = timeline_fence_release,
	.fence_value_str = timeline_fence_value_str,
	.timeline_value_str = timeline_fence_timeline_value_str,
};
#if 0
/*
 * *WARNING*
 *
 * improper use of this can result in deadlocking kernel drivers from userspace.
 */

/* opening sw_sync create a new sync obj */
static int sw_sync_debugfs_open(struct inode *inode, struct file *file)
{
	struct hi_sync_timeline *obj;
	char task_comm[TASK_COMM_LEN];

	get_task_comm(task_comm, current);

	obj = hi_sync_timeline_create(task_comm);
	if (!obj)
		return -ENOMEM;

	file->private_data = obj;

	return 0;
}

static int sw_sync_debugfs_release(struct inode *inode, struct file *file)
{
	struct hi_sync_timeline *obj = file->private_data;

	smp_wmb();

	hi_sync_timeline_put(obj);
	return 0;
}

static long sw_sync_ioctl_create_fence(struct hi_sync_timeline *obj,
				       unsigned long arg)
{
	int fd = get_unused_fd_flags(O_CLOEXEC);
	int err;
	struct hi_sync_pt *pt;
	struct sync_file *sync_file;
	struct sw_sync_create_fence_data data;

	if (fd < 0)
		return fd;

	if (copy_from_user(&data, (void __user *)arg, sizeof(data))) {
		err = -EFAULT;
		goto err;
	}

	pt = hi_sync_pt_create(obj, sizeof(*pt), data.value);
	if (!pt) {
		err = -ENOMEM;
		goto err;
	}

	sync_file = sync_file_create(&pt->base);
	fence_put(&pt->base);
	if (!sync_file) {
		err = -ENOMEM;
		goto err;
	}

	data.fence = fd;
	if (copy_to_user((void __user *)arg, &data, sizeof(data))) {
		fput(sync_file->file);
		err = -EFAULT;
		goto err;
	}

	fd_install(fd, sync_file->file);

	return 0;

err:
	put_unused_fd(fd);
	return err;
}

static long sw_sync_ioctl_inc(struct hi_sync_timeline *obj, unsigned long arg)
{
	u32 value;

	if (copy_from_user(&value, (void __user *)arg, sizeof(value)))
		return -EFAULT;

	hi_sync_timeline_signal(obj, value);

	return 0;
}

static long sw_sync_ioctl(struct file *file, unsigned int cmd,
			  unsigned long arg)
{
	struct hi_sync_timeline *obj = file->private_data;

	switch (cmd) {
	case SW_SYNC_IOC_CREATE_FENCE:
		return sw_sync_ioctl_create_fence(obj, arg);

	case SW_SYNC_IOC_INC:
		return sw_sync_ioctl_inc(obj, arg);

	default:
		return -ENOTTY;
	}
}

const struct file_operations sw_sync_debugfs_fops = {
	.open           = sw_sync_debugfs_open,
	.release        = sw_sync_debugfs_release,
	.unlocked_ioctl = sw_sync_ioctl,
	.compat_ioctl	= sw_sync_ioctl,
};
#endif
