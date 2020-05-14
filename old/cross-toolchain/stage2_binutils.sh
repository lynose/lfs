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

BINUTILS_VERSION=2.21
export BINUTILS_VERSION &&
echo $BINUTILS_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/binutils-$BINUTILS_VERSION
 then
  rm -rf $SOURCES/binutils-$BINUTILS_VERSION
fi
tar xjf $PACKAGES/binutils-$BINUTILS_VERSION.tar.bz2 -C $SOURCES &&

if test -d $SOURCES/binutils-build
 then
  rm -rf $SOURCES/binutils-build
fi
mkdir -v $SOURCES/binutils-build &&

cd $SOURCES/binutils-build &&

sleep 10 &&

CC="$LFS_TGT-gcc -B/tools/lib/" AR=$LFS_TGT-ar RANLIB=$LFS_TGT-ranlib ../binutils-$BINUTILS_VERSION/configure --prefix=/tools --disable-nls --with-lib-path=/tools/lib &&
make &&
make install &&
make -C ld clean &&
make -C ld LIB_PATH=/usr/lib:/lib &&
cp -v ld/ld-new /tools/bin
