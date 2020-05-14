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

BASH_VERSION=4.2 &&
export BASH_VERSION &&
echo $BASH_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/bash-$BASH_VERSION
 then
  rm -rf $SOURCES/bash-$BASH_VERSION
fi
tar xjf $PACKAGES/bash-$BASH_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/bash-$BASH_VERSION &&

sleep 10 &&
./configure --prefix=/tools --without-bash-malloc &&
make &&
make tests &&
make install && 
ln -fvs bash /tools/bin/sh
