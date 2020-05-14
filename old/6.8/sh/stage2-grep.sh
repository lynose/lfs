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

GREP_VERSION=2.7 &&
export GREP_VERSION &&
echo $GREP_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/grep-$GREP_VERSION
 then
  rm -rf $SOURCES/grep-$GREP_VERSION
fi
tar xjf $PACKAGES/grep-$GREP_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/grep-$GREP_VERSION &&

sleep 10 &&
./configure --prefix=/tools \
  --disable-perl-regexp &&
make &&
make check &&
make install