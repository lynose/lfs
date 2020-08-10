#!/bin/bash
${log} `basename "$0"` " started" crosstools &&


if [ -d $LFS/sources/gcc-10.2.0 ]
 then
    rm -rf $LFS/sources/gcc-10.2.0
fi

tar xf $LFS/sources/gcc-10.2.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gcc-10.2.0 &&

if [ -d build ]
 then
  rm -rf build
fi

mkdir -v build &&
cd build &&

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0 &&
    
${log} `basename "$0"` " configured" crosstools &&

make &&
${log} `basename "$0"` " build" crosstools &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstools &&

if [ -d $LFS/sources/gcc-10.2.0 ]
 then
    rm -rf $LFS/sources/gcc-10.2.0
fi

${log} `basename "$0"` " finished" crosstools
