#!/bin/bash
if test -d $LFS/sources/gcc-10.1.0
 then
  rm -rf $LFS/sources/gcc-10.1.0
fi

tar -xJf $LFS/sources/gcc-10.1.0.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/gcc-10.1.0 &&

if test -d ../gcc-libstdc++-v3-build
 then
  rm -rf ../gcc-libstdc++-v3-build
fi
mkdir -v ../gcc-libstdc++-v3-build &&
cd ../gcc-libstdc++-v3-build &&

../gcc-10.1.0/libstdc++-v3/configure \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.1.0 &&

make &&
make install

