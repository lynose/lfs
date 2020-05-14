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

GZIP_VERSION=1.4 &&
export GZIP_VERSION &&
echo $GZIP_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/gzip-$GZIP_VERSION
 then
  rm -rf $SOURCES/gzip-$GZIP_VERSION
fi
tar xjf $PACKAGES/gzip-$GZIP_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/gzip-$GZIP_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install