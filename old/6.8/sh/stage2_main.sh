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


echo "!!!!!!!!!!!!! STAGE 2 !!!!!!!!!!!" >> $TOOLS/build.log  &&

echo "Build BINUTILS"  &&
./stage2_binutils.sh &&
echo "Build BINUTILS done" >> $TOOLS/build.log  &&
echo "Build BINUTILS done" &&
read &&

echo "Build GCC_CROSS" &&
./stage2-gcc-cross.sh &&
echo "Build GCC_CROSS done" >> $TOOLS/build.log  &&
echo "Build GCC_CROSS done" &&
read &&

echo "Build TCL" &&
./stage2-tcl.sh &&
echo "Build TCL done" >> $TOOLS/build.log  &&
echo "Build TCL done" &&
read &&

echo "Build EXPECT" &&
./stage2-expect.sh &&
echo "Build EXPECT done" >> $TOOLS/build.log  &&
echo "Build EXPECT done" &&
read &&

echo "Build DEJAGNU" &&
./stage2-deja-gnu.sh &&
echo "Build DEJAGNU done" >> $TOOLS/build.log  &&
echo "Build DEJAGNU done" &&
read &&

echo "Build NCURSES" &&
./stage2-ncurses.sh &&
echo "Build NCURSES done" >> $TOOLS/build.log  &&
echo "Build NCURSES done" &&
read &&

echo "Build BASH" &&
./stage2-bash.sh &&
echo "Build BASH done" >> $TOOLS/build.log  &&
echo "Build BASH done" &&
read &&

echo "Build BZIP" &&
./stage2-bzip.sh &&
echo "Build BZIP done" >> $TOOLS/build.log  &&
echo "Build BZIP done" &&
read &&

echo "Build COREUTILS" &&
./stage2-coreutils.sh &&
echo "Build COREUTILS done" >> $TOOLS/build.log  &&
echo "Build COREUTILS done" &&
read &&


echo "Build DIFFUTILS" &&
./stage2-diffutils.sh &&
echo "Build DIFFUTILS done" >> $TOOLS/build.log  &&
echo "Build DIFFUTILS done" &&
read &&


echo "Build FILE" &&
./stage2-file.sh &&
echo "Build FILE done" >> $TOOLS/build.log  &&
echo "Build FILE done"  &&
read &&

echo "Build FINDUTILS" &&
./stage2-findutils.sh &&
echo "Build FINDUTILS done" >> $TOOLS/build.log  &&
echo "Build FINDUTILS done" &&
read &&	

echo "Build GAWK" &&
./stage2-gawk.sh &&
echo "Build GAWK done" >> $TOOLS/build.log  &&
echo "Build GAWK done" &&
read &&

echo "Build GETTEXT" &&
./stage2-gettext.sh &&
echo "Build GETTEXT done" >> $TOOLS/build.log  &&
echo "Build GETTEXT done" &&
read &&

echo "Build GREP" &&
./stage2-grep.sh &&
echo "Build GREP done" >> $TOOLS/build.log  &&
echo "Build GREP done" &&
read &&

echo "Build GZIP" &&
./stage2-gzip.sh &&
echo "Build GZIP done" >> $TOOLS/build.log  &&
echo "Build GZIP done" &&
read &&

echo "Build M4" &&
./stage2-m4.sh &&
echo "Build M4 done" >> $TOOLS/build.log  &&
echo "Build M4 done" &&
read &&

echo "Build MAKE" &&
./stage2-make.sh &&
echo "Build MAKE done" >> $TOOLS/build.log  &&
echo "Build MAKE done" &&
read &&

echo "Build PATCH" &&
./stage2-patch.sh &&
echo "Build PATCH done" >> $TOOLS/build.log  &&
echo "Build PATCH done" &&
read &&

echo "Build PERL" &&
./stage2-perl.sh &&
echo "Build PERL done" >> $TOOLS/build.log  &&
echo "Build PERL done" &&
read &&

echo "Build SED" &&
./stage2-sed.sh &&
echo "Build SED done" >> $TOOLS/build.log  &&
echo "Build SED done" &&
read &&

echo "Build TAR" &&
./stage2-tar.sh &&
echo "Build TAR done" >> $TOOLS/build.log  &&
echo "Build TAR done" &&
read &&

echo "Build TEXINFO" &&
./stage2-texinfo.sh &&
echo "Build TEXTINFO done" >> $TOOLS/build.log  &&
echo "Build TEXTINFO done" &&
read &&

echo "Build XZ" &&
./stage2-xz.sh &&
echo "Build XZ done" >> $TOOLS/build.log  &&
echo "Build XZ done" &&
read &&

strip --strip-debug /tools/lib/* &&
strip --strip-unneeded /tools/{,s}bin/* &&
rm -rf /tools/{,share}/{info,man} &&
mkdir -v $LFS/{dev,proc,sys} &&
mknod -m 600 $LFS/dev/console c 5 1 &&
mknod -m 666 $LFS/dev/null c 1 3 &&
mount -v --bind /dev $LFS/dev &&
mount -vt devpts devpts $LFS/dev/pts &&
mount -vt tmpfs shm $LFS/dev/shm &&
mount -vt proc proc $LFS/proc &&
mount -vt sysfs sysfs $LFS/sys
cp -Rv $PACKAGES $LFS &&
cp -Rv $PATCHES $LFS &&
cp -Rv $RUN_DIR $LFS &&
echo "!!!!!!!!!!!!! STAGE 2 DONE !!!!!!!!!!!" >> $TOOLS/build.log