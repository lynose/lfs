#!/bin/bash
echo "System will be Build in $LFS" &&
echo $LFS_TGT &&
echo $LC_ALL &&
echo $PATH &&

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

SPECS=`dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/specs
$LFS_TGT-gcc -dumpspecs | sed \
  -e 's@/lib\(64\)\?/ld@/tools&@g' \
  -e "/^\*cpp:$/{n;s,$, -isystem /tools/include,}" > $SPECS 
echo "New specs file is: $SPECS"
unset SPECS
sleep 5 &&

#echo "Build BINUTILS" &&
#sleep 5 &&
#./stage2_binutils.sh &&

#echo "Build GCC_CROSS" &&
#sleep 5 &&
#./stage2-gcc-cross.sh &&

#echo "Build TCL" &&
#sleep 5 &&
#./stage2-tcl.sh &&

echo "Build EXPECT" &&
sleep 5 &&
./stage2-expect.sh &&

echo "Build DEJAGNU" &&
sleep 5 &&
./stage2-deja-gnu.sh &&

echo "Build EXPECT" &&
sleep 5 &&
./stage2-ncurses.sh &&

echo "Build BASH" &&
sleep 5 &&
./stage2-bash.sh &&

echo "Build BZIP" &&
sleep 5 &&
./stage2-bzip.sh &&

echo "Build COREUTILS" &&
sleep 5 &&
./stage2-coreutils.sh &&

echo "Build DIFFUTILS" &&
sleep 5 &&
./stage2-diffutils.sh &&

echo "Build FILE" &&
sleep 5 &&
./stage2-file.sh &&

echo "Build FINDUTILS" &&
sleep 5 &&
./stage2-findutils.sh &&

echo "Build GAWK" &&
sleep 5 &&
./stage2-gawk.sh


#echo "Build LINUX_HEADER"
#./stage1-linux-header.sh &&
#echo "Build GLIBC"
#./stage1-glibc.sh 