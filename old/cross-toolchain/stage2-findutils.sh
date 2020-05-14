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

FINDUTILS_VERSION=4.4.2 &&
export FINDUTILS_VERSION &&
echo $FINDUTILS_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/findutils-$FINDUTILS_VERSION
 then
  rm -rf $SOURCES/findutils-$FINDUTILS_VERSION
fi
tar xjf $PACKAGES/findutils-$FINDUTILS_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/findutils-$FINDUTILS_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install  