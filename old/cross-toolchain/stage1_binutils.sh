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

sleep 10 &&

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

../binutils-$BINUTILS_VERSION/configure \
    --target=$LFS_TGT --prefix=/tools \
    --disable-nls --disable-werror &&
make &&
case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install

