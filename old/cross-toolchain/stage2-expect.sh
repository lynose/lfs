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

EXPECT_VERSION=5.45 &&
export EXPECT_VERSION &&
echo $EXPECT_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/expect$EXPECT_VERSION
 then
  rm -rf $SOURCES/expect$EXPECT_VERSION
fi
tar xjf $PACKAGES/expect$EXPECT_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/expect$EXPECT_VERSION &&

sleep 10 &&
 
cp -v configure{,.orig} &&
sed 's:/usr/local/bin:/bin:' configure.orig > configure &&

./configure --prefix=/tools --with-tcl=/tools/lib \
  --with-tclinclude=/tools/include &&
make &&
make test &&
make SCRIPTS="" install