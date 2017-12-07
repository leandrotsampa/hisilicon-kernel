/*
 * include/linux/sync.h
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

#include <linux/types.h>
#include <linux/kref.h>
#include <linux/ktime.h>
#include <linux/list.h>
#include <linux/spinlock.h>
#include <linux/wait.h>
#include <linux/fence.h>

#include "_sync.h"

struct sync_timeline;
struct sync_pt;

/**
 * struct sync_timeline_ops - sync object implementation ops
 * @driver_name:	name of the implementation
 * @dup:		duplicate a sync_pt
 * @has_signaled:	returns:
 *			  1 if pt has signaled
 *			  0 if pt has not signaled
 *			 <0 on error
 * @compare:		returns:
 *			  1 if b will signal before a
 *			  0 if a and b will signal at the same time
 *			 -1 if a will signal before b
 * @free_pt:		called before sync_pt is freed
 * @release_obj:	called before sync_timeline is freed
 * @fill_driver_data:	write implementation specific driver data to data.
 *			  should return an error if there is not enough room
 *			  as specified by size.  This information is returned
 *			  to userspace by SYNC_IOC_FENCE_INFO.
 * @timeline_value_str: fill str with the value of the sync_timeline's counter
 * @pt_value_str:	fill str with the value of the sync_pt
 */
struct sync_timeline_ops {
	const char *driver_name;

	/* required */
	struct sync_pt * (*dup)(struct sync_pt *pt);

	/* required */
	int (*has_signaled)(struct sync_pt *pt);

	/* required */
	int (*compare)(struct sync_pt *a, struct sync_pt *b);

	/* optional */
	void (*free_pt)(struct sync_pt *sync_pt);

	/* optional */
	void (*release_obj)(struct sync_timeline *sync_timeline);

	/* optional */
	int (*fill_driver_data)(struct sync_pt *syncpt, void *data, int size);

	/* optional */
	void (*timeline_value_str)(struct sync_timeline *timeline, char *str,
				   int size);

	/* optional */
	void (*pt_value_str)(struct sync_pt *pt, char *str, int size);
};

/**
 * struct sync_timeline - sync object
 * @kref:		reference count on fence.
 * @ops:		ops that define the implementation of the sync_timeline
 * @name:		name of the sync_timeline. Useful for debugging
 * @destroyed:		set when sync_timeline is destroyed
 * @child_list_head:	list of children sync_pts for this sync_timeline
 * @child_list_lock:	lock protecting @child_list_head, destroyed, and
 *			  sync_pt.status
 * @active_list_head:	list of active (unsignaled/errored) sync_pts
 * @sync_timeline_list:	membership in global sync_timeline_list
 */
struct sync_timeline {
	struct kref		kref;
	const struct sync_timeline_ops	*ops;
	char			name[32];

	/* protected by child_list_lock */
	bool			destroyed;
	int			context, value;

	struct list_head	child_list_head;
	spinlock_t		child_list_lock;

	struct list_head	active_list_head;

#ifdef CONFIG_DEBUG_FS
	struct list_head	sync_timeline_list;
#endif
};

/**
 * struct sync_pt - sync point
 * @fence:		base fence class
 * @child_list:		membership in sync_timeline.child_list_head
 * @active_list:	membership in sync_timeline.active_list_head
 * @signaled_list:	membership in temporary signaled_list on stack
 * @fence:		sync_fence to which the sync_pt belongs
 * @pt_list:		membership in sync_fence.pt_list_head
 * @status:		1: signaled, 0:active, <0: error
 * @timestamp:		time which sync_pt status transitioned from active to
 *			  signaled or error.
 */
struct sync_pt {
	struct fence base;

	struct list_head	child_list;
	struct list_head	active_list;
};

static inline struct sync_timeline *sync_pt_parent(struct sync_pt *pt)
{
	return container_of(pt->base.lock, struct sync_timeline,
			    child_list_lock);
}

/*
 * API for sync_timeline implementers
 */

/**
 * sync_timeline_create() - creates a sync object
 * @ops:	specifies the implementation ops for the object
 * @size:	size to allocate for this obj
 * @name:	sync_timeline name
 *
 * Creates a new sync_timeline which will use the implementation specified by
 * @ops.  @size bytes will be allocated allowing for implementation specific
 * data to be kept after the generic sync_timeline struct.
 */
struct sync_timeline *hi_sync_timeline_create(const struct sync_timeline_ops *ops,
					   int size, const char *name);

/**
 * sync_timeline_destroy() - destroys a sync object
 * @obj:	sync_timeline to destroy
 *
 * A sync implementation should call this when the @obj is going away
 * (i.e. module unload.)  @obj won't actually be freed until all its children
 * sync_pts are freed.
 */
void hi_sync_timeline_destroy(struct sync_timeline *obj);

/**
 * sync_timeline_signal() - signal a status change on a sync_timeline
 * @obj:	sync_timeline to signal
 *
 * A sync implementation should call this any time one of it's sync_pts
 * has signaled or has an error condition.
 */
void hi_sync_timeline_signal(struct sync_timeline *obj);

/**
 * sync_pt_create() - creates a sync pt
 * @parent:	sync_pt's parent sync_timeline
 * @size:	size to allocate for this pt
 *
 * Creates a new sync_pt as a child of @parent.  @size bytes will be
 * allocated allowing for implementation specific data to be kept after
 * the generic sync_timeline struct.
 */
struct sync_pt *hi_sync_pt_create(struct sync_timeline *parent, int size);

/**
 * sync_pt_free() - frees a sync pt
 * @pt:		sync_pt to free
 *
 * This should only be called on sync_pts which have been created but
 * not added to a fence.
 */
void hi_sync_pt_free(struct sync_pt *pt);

#endif /* _LINUX_SYNC_H */
