#!/bin/bash
if test -d $LFS/sources/coreutils-8.32
 then
  rm -rf $LFS/sources/coreutils-8.32
fi
tar -xJf $LFS/sources/coreutils-8.32.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/coreutils-8.32 &&

./configure --prefix=/tools --enable-install-program=hostname &&
make &&
make -j1 RUN_EXPENSIVE_TESTS=yes check  &&
make install
