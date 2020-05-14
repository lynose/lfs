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

TOOLS=/tools &&
export TOOLS &&
echo $TOOLS &&

SOURCES=/sources &&
export SOURCES &&
echo $SOURCES &&
sleep 10
touch /var/run/utmp /var/log/{btmp,lastlog,wtmp} &&
chgrp -v utmp /var/run/utmp /var/log/lastlog &&
chmod -v 664 /var/run/utmp /var/log/lastlog &&

echo "!!!!!!!!!!!!! STAGE 3 !!!!!!!!!!!" >> $TOOLS/build.log  &&
echo "Build LINUX_HEADER" &&
./stage3_linuxheader.sh &&
echo "Build LINUX HEADER done" >> $TOOLS/build.log  &&
read &&

echo "Build MAN-PAGES" &&
./stage3-man-pages.sh &&
echo "Build MAN-PAGES done" >> $TOOLS/build.log  &&
read &&

echo "Build GLIBC" &&
./stage3-glibc.sh &&
echo "Build GLIBC done" >> $TOOLS/build.log  &&


mv -fv /tools/bin/{ld,ld-old} &&
mv -fv /tools/$(gcc -dumpmachine)/bin/{ld,ld-old} &&
mv -fv /tools/bin/{ld-new,ld} &&
ln -sfv /tools/bin/ld /tools/$(gcc -dumpmachine)/bin/ld &&
read &&
gcc -dumpspecs | sed -e 's@/tools@@g' \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' > \
    `dirname $(gcc --print-libgcc-file-name)`/specs &&

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log &&
grep -B1 '^ /usr/include' dummy.log &&
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' &&
grep "/lib.*/libc.so.6 " dummy.log &&
rm -v dummy.c a.out dummy.log &&
read &&


echo "Build BINUTILS" &&
./stage3-binutils.sh &&
echo "Build BINUTILS done" >> $TOOLS/build.log  &&
read &&

echo "Build GMP" &&
./stage3-gmp.sh &&
echo "Build GMP done" >> $TOOLS/build.log  &&
read &&

echo "Build MPFS" &&
./stage3-mpfr.sh &&
echo "Build MPFS done" >> $TOOLS/build.log  &&
read &&

echo "Build MPC" &&
./stage3-mpc.sh &&
echo "Build MPC done" >> $TOOLS/build.log  &&
read &&

echo "Build GCC" &&
./stage3-gcc.sh &&
echo "Build GCC done" >> $TOOLS/build.log  &&
read &&

mkdir -v $LFS/{dev,proc,sys} &&
mknod -m 600 $LFS/dev/console c 5 1 &&
mknod -m 666 $LFS/dev/null c 1 &&
mount -v --bind /dev $LFS/de &&
mount -vt devpts devpts $LFS/dev/pts &&
mount -vt tmpfs shm $LFS/dev/shm &&
mount -vt proc proc $LFS/proc &&
mount -vt sysfs sysfs $LFS/sys