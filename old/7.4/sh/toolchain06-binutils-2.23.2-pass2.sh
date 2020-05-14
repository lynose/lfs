#!/bin/bash
if test -d $LFS/sources/binutils-2.23.2
 then
  rm -rf $LFS/sources/binutils-2.23.2
fi
tar -xjf $LFS/sources/binutils-2.23.2.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/binutils-2.23.2 &&

sed -i -e 's/@colophon/@@colophon/' \
       -e 's/doc@cygnus.com/doc@@cygnus.com/' bfd/doc/bfd.texinfo &&

if test -d ../binutils-build
 then
  rm -rf ../binutils-build
fi
mkdir -v ../binutils-build &&
cd ../binutils-build &&

CC=$LFS_TGT-gcc                \
AR=$LFS_TGT-ar                 \
RANLIB=$LFS_TGT-ranlib         \
../binutils-2.23.2/configure   \
    --prefix=/tools            \
    --disable-nls              \
    --with-lib-path=/tools/lib \
    --with-sysroot &&
make &&
make install &&
make -C ld clean &&
make -C ld LIB_PATH=/usr/lib:/lib &&
cp -v ld/ld-new /tools/bin
