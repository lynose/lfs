#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

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
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
make -C ld clean &&
make -C ld LIB_PATH=/usr/lib:/lib &&
${log} `basename "$0"` " build ld" toolchain &&
cp -v ld/ld-new /tools/bin &&
${log} `basename "$0"` " installed ld" toolchain &&
${log} `basename "$0"` " finished" toolchain
