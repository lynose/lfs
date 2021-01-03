#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/binutils-2.35.1 ]
 then
  rm -rf $LFS/sources/binutils-2.35.1
fi
tar xf $LFS/sources/binutils-2.35.1.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/binutils-2.35.1 &&

mkdir -v build &&
cd build &&

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
${log} `basename "$0"` " finished" crosstemp
