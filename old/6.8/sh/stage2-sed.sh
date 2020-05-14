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

SED_VERSION=4.2.1 &&
export SED_VERSION &&
echo $SED_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/sed-$SED_VERSION
 then
  rm -rf $SOURCES/sed-$SED_VERSION
fi
tar xjf $PACKAGES/sed-$SED_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/sed-$SED_VERSION &&

sleep 10 &&
./configure --prefix=/tools &&
make &&
make check &&
make install