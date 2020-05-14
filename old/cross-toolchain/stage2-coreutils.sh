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

COREUTILS_VERSION=8.10 &&
export COREUTILS_VERSION &&
echo $COREUTILS_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/coreutils-$COREUTILS_VERSION
 then
  rm -rf $SOURCES/coreutils-$COREUTILS_VERSION
fi
tar xjf $PACKAGES/coreutils-$COREUTILS_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/coreutils-$COREUTILS_VERSION &&

sleep 10 &&
./configure --prefix=/tools --enable-install-program=hostname
make &&
make RUN_EXPENSIVE_TESTS=yes check &&
make install &&
cp -v src/su /tools/bin/su-tools