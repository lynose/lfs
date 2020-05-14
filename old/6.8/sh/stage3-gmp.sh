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

GMP_VERSION=5.0.1
export GMP_VERSION &&
echo $GMP_VERSION &&

if test -d $SOURCES/gmp-$GMP_VERSION
 then
  rm -rf $SOURCES/gmp-$GMP_VERSION
fi
tar xjf $PACKAGES/gmp-$GMP_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/gmp-$GMP_VERSION &&

ABI=32 ./configure --prefix=/usr --enable-cxx --enable-mpbsd &&
make &&
make check 2>&1 | tee gmp-check-log &&
awk '/tests passed/{total+=$2} ; END{print total}' gmp-check-log &&
make install &&
mkdir -v /usr/share/doc/gmp-5.0.1 &&
cp    -v doc/{isa_abi_headache,configuration} doc/*.html \
         /usr/share/doc/gmp-5.0.1
