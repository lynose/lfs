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
echo $SOURCES &&

MAN_PAGES_VERSION=3.32 &&
export MAN_PAGES_VERSION &&
echo $MAN_PAGES_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/man-pages-$MAN_PAGES_VERSION
 then
  rm -rf $SOURCES/man-pages-$MAN_PAGES_VERSION
fi
tar xjf $PACKAGES/man-pages-$MAN_PAGES_VERSION.tar.bz2 -C $SOURCES &&
cd $SOURCES/man-pages-$MAN_PAGES_VERSION