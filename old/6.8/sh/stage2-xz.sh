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

XZ_VERSION=5.0.1 &&
export XZ_VERSION &&
echo $XZ_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/xz-$XZ_VERSION
 then
  rm -rf $SOURCES/xz-$XZ_VERSION
fi
tar xjf $PACKAGES/xz-$XZ_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/xz-$XZ_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install