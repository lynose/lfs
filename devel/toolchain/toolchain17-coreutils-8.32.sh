#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/coreutils-8.32
 then
  rm -rf $LFS/sources/coreutils-8.32
fi
tar -xJf $LFS/sources/coreutils-8.32.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/coreutils-8.32 &&

./configure --prefix=/tools --enable-install-program=hostname &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make -j1 RUN_EXPENSIVE_TESTS=yes check  &&
${log} `basename "$0"` " checked" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
