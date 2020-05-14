#!/bin/bash
if test -d $LFS/sources/binutils-2.22
 then
  rm -rf $LFS/sources/binutils-2.22
fi
tar -xjf $LFS/sources/binutils-2.22.tar.bz2 -C $LFS/sources/
cd $LFS/sources/binutils-2.22 &&
patch -Np1 -i ../binutils-2.22-build_fix-1.patch &&

if test -d ../binutils-build
 then
  rm -rf ../binutils-build
fi
mkdir -v ../binutils-build
cd ../binutils-build &&

../binutils-2.22/configure     \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror &&
make &&

case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install
