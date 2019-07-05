
SDK_DIR=${PWD}

include base.mak

all:
	make -C source/common/drv

clean:
	make -C source/common/drv clean

modules_install:
	make -C source/common/drv modules_install

