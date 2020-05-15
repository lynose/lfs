#!/bin/bash
if test -d $LFS/sources/binutils-2.34
 then
  rm -rf $LFS/sources/binutils-2.34
fi
tar -xJf $LFS/sources/binutils-2.34.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/binutils-2.34 &&

if test -d ../binutils-build
 then
  rm -rf ../binutils-build
fi
mkdir -v ../binutils-build &&
cd ../binutils-build &&

CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../binutils-2.34/configure   \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot &&
make &&
make install &&
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin
