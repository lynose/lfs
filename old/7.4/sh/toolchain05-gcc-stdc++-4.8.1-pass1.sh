#!/bin/bash
if test -d $LFS/sources/gcc-4.8.1
 then
  rm -rf $LFS/sources/gcc-4.8.1
fi

tar -xjf $LFS/sources/gcc-4.8.1.tar.bz2 -C $LFS/sources/ &&

cd $LFS/sources/gcc-4.8.1 &&

if test -d ../gcc-build
 then
  rm -rf ../gcc-build
fi
mkdir -v ../gcc-build &&
cd ../gcc-build &&

../gcc-4.8.1/libstdc++-v3/configure \
    --host=$LFS_TGT                      \
    --prefix=/tools                      \
    --disable-multilib                   \
    --disable-shared                     \
    --disable-nls                        \
    --disable-libstdcxx-threads          \
    --disable-libstdcxx-pch              \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/4.8.1 &&

make &&
make install

