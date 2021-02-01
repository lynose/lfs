#!/bin/bash
${log} `basename "$0"` " started" crosstools &&

if [ -d $LFS/sources/binutils-2.36 ]
 then
  rm -rf $LFS/sources/binutils-2.36
fi

tar xf $LFS/sources/binutils-2.36.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/binutils-2.36 &&

mkdir -v build &&
cd build &&

../configure --prefix=$LFS/tools        \
             --with-sysroot=$LFS        \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror           &&

${log} `basename "$0"` " configured" crosstools &&
make &&
${log} `basename "$0"` " build" crosstools &&

make install &&
${log} `basename "$0"` " installed" crosstools &&
${log} `basename "$0"` " finished" crosstools
