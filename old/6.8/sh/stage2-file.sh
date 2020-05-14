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

FILE_VERSION=5.05 &&
export FILE_VERSION &&
echo $FILE_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/file-$FILE_VERSION
 then
  rm -rf $SOURCES/file-$FILE_VERSION
fi
tar xjf $PACKAGES/file-$FILE_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/file-$FILE_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install  

