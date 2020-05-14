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

DIFFUTILS_VERSION=3.0 &&
export DIFFUTILS_VERSION &&
echo $DIFFUTILS_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/diffutils-$DIFFUTILS_VERSION
 then
  rm -rf $SOURCES/diffutils-$DIFFUTILS_VERSION
fi
tar xjf $PACKAGES/diffutils-$DIFFUTILS_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/diffutils-$DIFFUTILS_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install  

