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

../binutils-2.34/configure   \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror
    
make &&

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install