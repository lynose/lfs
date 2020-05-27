#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/tar-1.32
 then
  rm -rf $LFS/sources/tar-1.32
fi
tar -xJf $LFS/sources/tar-1.32.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/tar-1.32 &&


./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " checked" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
