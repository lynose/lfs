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

MPC_VERSION=0.8.2
export MPC_VERSION &&
echo $MPC_VERSION &&

if test -d $SOURCES/mpc-$MPC_VERSION
 then
  rm -rf $SOURCES/mpc-$MPC_VERSION
fi
tar xjf $PACKAGES/mpc-$MPC_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/mpc-$MPC_VERSION &&
 
./configure --prefix=/usr &&
make &&
make check &&
make install
