#!/bin/bash
${log} `basename "$0"` " started" crosstools &&

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
mv -v mpc-1.1.0 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

if [ -d build ]
 then
  rm -rf build
fi

mkdir -v build &&
cd build &&

../configure                                       \
    --target=$LFS_TGT                              \
    --prefix=$LFS/tools                            \
    --with-glibc-version=2.11                      \
    --with-sysroot=$LFS                            \
    --with-newlib                                  \
    --without-headers                              \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-shared                               \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-threads                              \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++                        &&

${log} `basename "$0"` " configured" crosstools &&

make &&
${log} `basename "$0"` " build" crosstools &&

make install && 
cd .. &&
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h &&
${log} `basename "$0"` " installed" crosstools &&
${log} `basename "$0"` " finished" crosstools



