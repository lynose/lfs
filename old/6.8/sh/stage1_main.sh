#!/bin/bash
echo "System will be Build in $LFS" &&
echo $LFS_TGT
echo $LC_ALL
sleep 5 &&

RUN_DIR=$PWD &&
export RUN_DIR &&
echo $RUN_DIR &&

PACKAGES=$RUN_DIR/../packages &&
export PACKAGES &&
echo $PACKAGES &&

PATCHES=$RUN_DIR/../patch &&
export PATCHES &&
echo $PATCHES

TOOLS=$LFS/tools &&
export TOOLS &&
echo $TOOLS &&

SOURCES=$LFS/sources &&
export SOURCES &&
echo $SOURCES &&
echo "Removing old builds" &&

rm -rf $TOOLS/* &&
rm -rf $SOURCES/* &&

if test -e /tools
 then
  rm /tools 
fi
ln -s $TOOLS /tools &&

echo "!!!!!!!!!!!!! STAGE 1!!!!!!!!!!!" >> $TOOLS/build.log  &&
echo "Build BINUTILS" &&
./stage1_binutils.sh &&
echo "Build BINUTILS done" >> $TOOLS/build.log  &&
echo "Build BINUTILS done" &&

echo "Build GCC_CROSS" &&
./stage1-gcc-cross.sh &&
echo "Build GCC_CROSS done" >> $TOOLS/build.log  &&
echo "Build GCC_CROSS done" &&

echo "Build LINUX_HEADER" &&
./stage1-linux-header.sh &&
echo "Build LINUX_HEADER done" >> $TOOLS/build.log  &&
echo "Build LINUX_HEADER done" &&

echo "Build GLIBC"
./stage1-glibc.sh &&
echo "Build GLIBC done" >> $TOOLS/build.log  &&
echo "Build GLIBC done" &&
echo "!!!!!!!!!!!!! STAGE 1 DONE !!!!!!!!!!!" >> $TOOLS/build.log