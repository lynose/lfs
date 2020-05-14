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

MPFR_VERSION=3.0.0
export MPFR_VERSION &&
echo $MPFR_VERSION &&

if test -d $SOURCES/mpfr-$MPFR_VERSION
 then
  rm -rf $SOURCES/mpfr-$MPFR_VERSION
fi
tar xjf $PACKAGES/mpfr-$MPFR_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/mpfr-$MPFR_VERSION &&

 
./configure --prefix=/usr --enable-thread-safe \
  --docdir=/usr/share/doc/mpfr-$MPFR_VERSION &&
make &&
make check &&
make install &&
make html &&
make install-html