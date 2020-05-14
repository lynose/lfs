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

BZIP_VERSION=1.0.6 &&
export BZIP_VERSION &&
echo $BZIP_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/bzip-$BZIP_VERSION
 then
  rm -rf $SOURCES/bzip-$BZIP_VERSION
fi
tar xjf $PACKAGES/bzip-$BZIP_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/bzip-$BZIP_VERSION &&

sleep 10 &&
make &&
make PREFIX=/tools install