/*
 * Sync File validation framework and debug infomation
 *
 * Copyright (C) 2012 Google, Inc.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#ifndef _LINUX_SYNC_H
#define _LINUX_SYNC_H

#include <linux/list.h>
#include <linux/spinlock.h>
#include <linux/fence.h>

#include <linux/sync_file.h>
#include <uapi/linux/sync_file.h>

/**
 * struct hi_sync_timeline - sync object
 * @kref:		reference count on fence.
 * @name:		name of the hi_sync_timeline. Useful for debugging
 * @child_list_head:	list of children hi_sync_pts for this hi_sync_timeline
 * @child_list_lock:	lock protecting @child_list_head and fence.status
 * @active_list_head:	list of active (unsignaled/errored) hi_sync_pts
 * @hi_sync_timeline_list:	membership in global hi_sync_timeline_list
 */
struct hi_sync_timeline {
	struct kref		kref;
	char			name[32];

	/* protected by child_list_lock */
	u64			context;
	int			value;

	struct list_head	child_list_head;
	spinlock_t		child_list_lock;

	struct list_head	active_list_head;

	struct list_head	sync_timeline_list;
};

static inline struct hi_sync_timeline *fence_parent(struct fence *fence)
{
	return container_of(fence->lock, struct hi_sync_timeline,
			    child_list_lock);
}

struct hi_sync_timeline *hi_sync_timeline_create(const char *name);
void hi_sync_timeline_signal(struct hi_sync_timeline *obj, unsigned int inc);
void hi_sync_timeline_destroy(struct hi_sync_timeline *obj);

/**
 * struct hi_sync_pt - hi_sync_pt object
 * @base: base fence object
 * @child_list: sync timeline child's list
 * @active_list: sync timeline active child's list
 */
struct hi_sync_pt {
	struct fence base;
	struct list_head child_list;
	struct list_head active_list;
};

struct hi_sync_pt *hi_sync_pt_create(struct hi_sync_timeline *obj, int size,
                             unsigned int value);

#ifdef CONFIG_SW_SYNC

extern const struct file_operations sw_sync_debugfs_fops;

void hi_sync_timeline_debug_add(struct hi_sync_timeline *obj);
void hi_sync_timeline_debug_remove(struct hi_sync_timeline *obj);
void sync_file_debug_add(struct sync_file *fence);
void sync_file_debug_remove(struct sync_file *fence);
void sync_dump(void);

#else
# define hi_sync_timeline_debug_add(obj)
# define hi_sync_timeline_debug_remove(obj)
# define sync_file_debug_add(fence)
# define sync_file_debug_remove(fence)
# define sync_dump()
#endif

#endif /* _LINUX_SYNC_H */
