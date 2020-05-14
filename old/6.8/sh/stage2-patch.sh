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
echo $SOURCES

PATCH_VERSION=2.6.1 &&
export PATCH_VERSION &&
echo $PATCH_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/patch-$PATCH_VERSION
 then
  rm -rf $SOURCES/patch-$PATCH_VERSION
fi
tar xjf $PACKAGES/patch-$PATCH_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/patch-$PATCH_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install