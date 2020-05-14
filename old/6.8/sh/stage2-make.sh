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

MAKE_VERSION=3.82 &&
export MAKE_VERSION &&
echo $MAKE_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/make-$MAKE_VERSION
 then
  rm -rf $SOURCES/make-$MAKE_VERSION
fi
tar xjf $PACKAGES/make-$MAKE_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/make-$MAKE_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
#make check &&
make install