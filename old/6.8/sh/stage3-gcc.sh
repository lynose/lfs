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

MPFR_LIB_VERSION=3.0.0 &&
export MPFR_LIB_VERSION &&
echo $MPFR_LIB_VERSION &&

GMP_LIB_VERSION=5.0.1 &&
export GMP_LIB_VERSION &&
echo $GMP_LIB_VERSION &&

MPC_LIB_VERSION=0.8.2 &&
export MPC_LIB_VERSION &&
echo $MPC_LIB_VERSION &&

GCC_CROSS_VERSION=4.5.2 &&
export GCC_CROSS_VERSION &&
echo $GCC_CROSS_VERSION &&

echo $LFS_TGT &&

sleep 10 &&

if test -d $SOURCES/gcc-$GCC_CROSS_VERSION
 then
   rm -rf $SOURCES/gcc-$GCC_CROSS_VERSION
fi
tar xjf $PACKAGES/gcc-$GCC_CROSS_VERSION.tar.bz2 -C $SOURCES &&

if test -d $SOURCES/gcc-build
 then
  rm -rf $SOURCES/gcc-build
fi
mkdir -v $SOURCES/gcc-build &&

cd $SOURCES/gcc-$GCC_CROSS_VERSION &&
sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in &&

cd $SOURCES/gcc-build &&

../gcc-&GCC_CROSS_VERSION/configure --prefix=/usr \
    --libexecdir=/usr/lib --enable-shared \
    --enable-threads=posix --enable-__cxa_atexit \
    --enable-clocale=gnu --enable-languages=c,c++ \
    --disable-multilib --disable-bootstrap --with-system-zlib &&

make &&
ulimit -s 16384 &&
make -k check &&
../gcc-4.5.2/contrib/test_summary &&
make install &&
ln -sv ../usr/bin/cpp /lib &&
ln -sv gcc /usr/bin/cc &&
echo 'main(){}' > dummy.c &&
cc dummy.c -v -Wl,--verbose &> dummy.log &&
readelf -l a.out | grep ': /lib' &&
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log &&
grep -B4 '^ /usr/include' dummy.log &&
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' &&
grep "/lib.*/libc.so.6 " dummy.log &&
grep found dummy.log &&
rm -v dummy.c a.out dummy.log