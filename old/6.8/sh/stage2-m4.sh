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

M4_VERSION=1.4.15 &&
export M4_VERSION &&
echo $M4_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/m4-$M4_VERSION
 then
  rm -rf $SOURCES/m4-$M4_VERSION
fi
tar xjf $PACKAGES/m4-$M4_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/m4-$M4_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install