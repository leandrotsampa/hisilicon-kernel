
objects := pq hdmi vo hifb tde jpeg

objects += gfx2d

objects += gpu

objects_install:=${addsuffix _install,${objects}}

#=================================================================
#	  rules
#=================================================================

.PHONY: all clean modules_install ${objects} ${objects_clean} ${objects_install} ${objects_uninstall} ${objects_prepare}

all: ${objects}

modules_install: ${objects_install}

${objects}:
	make -C $@

${objects_install}:
	make -C ${patsubst %_install,%,$@} modules_install
