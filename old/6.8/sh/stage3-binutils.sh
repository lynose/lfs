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

cd $SOURCES/binutils-$BINUTILS_VERSION &&
expect -c "spawn ls" &&
sleep 5 &&
rm -fv etc/standards.info &&
sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in &&

if test -d $SOURCES/binutils-build
 then
  rm -rf $SOURCES/binutils-build
fi
mkdir -v $SOURCES/binutils-build &&

cd $SOURCES/binutils-build &&

../binutils-2.21/configure --prefix=/usr \
    --enable-shared &&
make tooldir=/usr &&
make check &&
make tooldir=/usr install &&
cp -v ../binutils-2.21/include/libiberty.h /usr/include
