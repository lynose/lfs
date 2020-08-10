#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/gcc-10.2.0 ]
 then
  rm -rf $LFS/sources/gcc-10.2.0
fi

tar xf $LFS/sources/gcc-10.2.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gcc-10.2.0 &&
tar xf ../mpfr-4.1.0.tar.xz &&
mv -v mpfr-4.1.0 mpfr &&
tar xf ../gmp-6.2.0.tar.xz &&
mv -v gmp-6.2.0 gmp &&
tar xf ../mpc-1.1.0.tar.gz &&
mv -v mpc-1.1.0 mpc &&

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac

if [ -d build ]
 then
  rm -rf build
fi
mkdir -v build &&
cd build &&

mkdir -pv $LFS_TGT/libgcc &&
ln -s ../../../libgcc/gthr-posix.h $LFS_TGT/libgcc/gthr-default.h &&

../configure                                       \
    --build=$(../config.guess)                     \
    --host=$LFS_TGT                                \
    --prefix=/usr                                  \
    CC_FOR_TARGET=$LFS_TGT-gcc                     \
    --with-build-sysroot=$LFS                      \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++ &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
ln -sv gcc $LFS/usr/bin/cc &&
${log} `basename "$0"` " installed" crosstemp &&
if [ -d $LFS/sources/gcc-10.2.0 ]
 then
  rm -rf $LFS/sources/gcc-10.2.0
fi
${log} `basename "$0"` " finished" crosstemp

