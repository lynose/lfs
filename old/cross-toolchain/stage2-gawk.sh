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

GAWK_VERSION=3.1.8 &&
export GAWK_VERSION &&
echo $GAWK_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/gawk-$GAWK_VERSION
 then
  rm -rf $SOURCES/gawk-$GAWK_VERSION
fi
tar xjf $PACKAGES/gawk-$GAWK_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/gawk-$GAWK_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install 