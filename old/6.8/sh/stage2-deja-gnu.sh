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

DEJA_GNU_VERSION=1.4.4 &&
export DEJA_GNU_VERSION &&
echo $DEJA_GNU_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/dejagnu-$DEJA_GNU_VERSION
 then
  rm -rf $SOURCES/dejagnu-$DEJA_GNU_VERSION
fi
tar xjf $PACKAGES/dejagnu-$DEJA_GNU_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/dejagnu-$DEJA_GNU_VERSION &&
patch -Np1 -i $PATCHES/dejagnu-$DEJA_GNU_VERSION-consolidated-1.patch

sleep 10 &&
./configure --prefix=/tools &&
make &&
make install &&
make check