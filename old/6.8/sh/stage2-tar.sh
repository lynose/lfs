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

TAR_VERSION=1.25 &&
export TAR_VERSION &&
echo $TAR_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/tar-$TAR_VERSION
 then
  rm -rf $SOURCES/tar-$TAR_VERSION
fi
tar xjf $PACKAGES/tar-$TAR_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/tar-$TAR_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install