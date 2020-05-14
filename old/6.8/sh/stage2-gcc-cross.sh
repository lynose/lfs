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

patch -Np1 -i $PATCHES/gcc-$GCC_CROSS_VERSION-startfiles_fix-1.patch &&

cp -v gcc/Makefile.in{,.orig}
sed 's@\./fixinc\.sh@-c true@' gcc/Makefile.in.orig > gcc/Makefile.in

cp -v gcc/Makefile.in{,.tmp}
sed 's/^T_CFLAGS =$/& -fomit-frame-pointer/' gcc/Makefile.in.tmp \
  > gcc/Makefile.in

for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
  -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_INCLUDE_DIR
#define STANDARD_INCLUDE_DIR 0
#define STANDARD_STARTFILE_PREFIX_1 ""
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

case $(uname -m) in
  x86_64)
    for file in $(find gcc/config -name t-linux64) ; do \
      cp -v $file{,.orig}
      sed '/MULTILIB_OSDIRNAMES/d' $file.orig > $file
    done
  ;;
esac
sleep 5
tar -jxf $PACKAGES/mpfr-$MPFR_LIB_VERSION.tar.bz2 -C . &&
mv -v mpfr-$MPFR_LIB_VERSION mpfr &&
tar -jxf $PACKAGES/gmp-$GMP_LIB_VERSION.tar.bz2 -C . &&
mv -v gmp-$GMP_LIB_VERSION gmp &&
tar -xzf $PACKAGES/mpc-$MPC_LIB_VERSION.tar.gz -C . &&
mv -v mpc-$MPC_LIB_VERSION mpc &&

cd $SOURCES/gcc-build &&

CC="$LFS_TGT-gcc -B/tools/lib/" \
    AR=$LFS_TGT-ar RANLIB=$LFS_TGT-ranlib \
    ../gcc-$GCC_CROSS_VERSION/configure --prefix=/tools \
    --with-local-prefix=/tools --enable-clocale=gnu \
    --enable-shared --enable-threads=posix \
    --enable-__cxa_atexit --enable-languages=c,c++ \
    --disable-libstdcxx-pch --disable-multilib \
    --disable-bootstrap --disable-libgomp \
    --with-gmp-include=$(pwd)/gmp --with-gmp-lib=$(pwd)/gmp/.libs \
    --without-ppl --without-cloog &&

make &&
make install &&
ln -fvs gcc /tools/bin/cc
