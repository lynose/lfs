#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/glibc-2.31
 then
  rm -rf $LFS/sources/glibc-2.31
fi
tar -xJf $LFS/sources/glibc-2.31.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/glibc-2.31 &&

if test -d ../glibc-build
 then
  rm -rf ../glibc-build
fi

mkdir -v ../glibc-build &&
cd ../glibc-build &&

../glibc-2.31/configure                  \
      --prefix=/tools                    \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=/tools/include &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
