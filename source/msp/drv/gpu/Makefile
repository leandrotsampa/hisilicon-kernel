#=======================================
#	local variable
#=======================================

objects := mali700

objects_clean	    := ${addsuffix _clean,${objects}}
objects_install	    := ${addsuffix _install,${objects}}
objects_uninstall   := ${addsuffix _uninstall,${objects}}

EXTRA_CFLAGS := -Werror

obj-m += $(objects)/

#===============================================================================
#   rules
#===============================================================================

.PHONY: all clean install uninstall ${objects} ${objects_clean} ${objects_install} ${objects_uninstall} ${objects_prepare}

all: ${objects}

modules_install: all
	make -C $(objects) modules_install

${objects}:
	make -C $@

