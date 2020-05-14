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

NCURSES_VERSION=5.7 &&
export NCURSES_VERSION &&
echo $NCURSES_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/ncurses-$NCURSES_VERSION
 then
  rm -rf $SOURCES/ncurses-$NCURSES_VERSION
fi
tar xjf $PACKAGES/ncurses-$NCURSES_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/ncurses-$NCURSES_VERSION &&

sleep 10 &&
./configure --prefix=/tools --with-shared \
    --without-debug --without-ada --enable-overwrite &&
make &&
make install 
