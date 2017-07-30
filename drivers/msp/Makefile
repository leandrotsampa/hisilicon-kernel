#=======================================
#	local variable
#======================================
JPGE_SUPPORT := y

objects := gpio pdm pq hdmi vo hifb tde jpeg png ddr

objects += i2c demux

objects += sync adsp aiao adec vpss mce

ifeq ($(JPGE_SUPPORT),y)
objects += jpge
endif

objects += gfx2d
objects += pvr
objects += gpu
objects += hi_dbe
objects += keyled
objects += sci
objects += aenc
objects += base

obj-y += ${addsuffix /,${objects}}
