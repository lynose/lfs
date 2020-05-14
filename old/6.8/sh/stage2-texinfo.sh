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

TEXINFO_VERSION=4.13 &&
export TEXINFO_VERSION &&
echo $TEXINFO_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/texinfo-$TEXINFO_VERSION
 then
  rm -rf $SOURCES/texinfo-$TEXINFO_VERSION
fi
tar xjf $PACKAGES/texinfo-4.13a.tar.bz2 -C $SOURCES &&

cd $SOURCES/texinfo-$TEXINFO_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install