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
tar -jxf $PACKAGES/mpfr-$MPFR_LIB_VERSION.tar.bz2 -C . &&
mv -v mpfr-$MPFR_LIB_VERSION mpfr &&
tar -jxf $PACKAGES/gmp-$GMP_LIB_VERSION.tar.bz2 -C . &&
mv -v gmp-$GMP_LIB_VERSION gmp &&
tar -xzf $PACKAGES/mpc-$MPC_LIB_VERSION.tar.gz -C . &&
mv -v mpc-$MPC_LIB_VERSION mpc &&

cd $SOURCES/gcc-build &&

../gcc-$GCC_CROSS_VERSION/configure \
    --target=$LFS_TGT --prefix=/tools \
    --disable-nls --disable-shared --disable-multilib \
    --disable-decimal-float --disable-threads \
    --disable-libmudflap --disable-libssp \
    --disable-libgomp --enable-languages=c \
    --with-gmp-include=$(pwd)/gmp --with-gmp-lib=$(pwd)/gmp/.libs \
    --without-ppl --without-cloog &&

make &&
make install &&
 
ln -vs libgcc.a `$LFS_TGT-gcc -print-libgcc-file-name | \
    sed 's/libgcc/&_eh/'`
