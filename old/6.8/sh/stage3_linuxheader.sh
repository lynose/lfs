#!/bin/bash
RUN_DIR=$PWD &&
export RUN_DIR &&
echo $RUN_DIR &&

PACKAGES=$RUN_DIR/../packages &&
export PACKAGES &&
echo $PACKAGES &&

PATCHES=$RUN_DIR/../patch &&
export PATCHES &&
echo $PATCHES

SOURCES=$LFS/sources &&
export SOURCES &&
echo $SOURCES &&

KERNEL_VERSION=2.6.37 &&
export KERNEL_VERSION &&
echo $KERNEL_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/linux-$KERNEL_VERSION
 then
  rm -rf $SOURCES/linux-$KERNEL_VERSION
fi
tar xjf $PACKAGES/linux-$KERNEL_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/linux-$KERNEL_VERSION &&

make mrproper &&

make headers_check &&
make INSTALL_HDR_PATH=dest headers_install &&
find dest/include \( -name .install -o -name ..install.cmd \) -delete &&
cp -rv dest/include/* /usr/include