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

GETTEXT_VERSION=0.18.1.1 &&
export GETTEXT_VERSION &&
echo $GETTEXT_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/gettext-$GETTEXT_VERSION
 then
  rm -rf $SOURCES/gettext-$GETTEXT_VERSION
fi
tar xjf $PACKAGES/gettext-$GETTEXT_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/gettext-$GETTEXT_VERSION &&

cd gettext-tools && 
./configure --prefix=/tools --disable-shared &&
make -C gnulib-lib
make -C src msgfmt
cp -fv src/msgfmt /tools/bin