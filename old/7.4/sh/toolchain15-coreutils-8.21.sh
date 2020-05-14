#!/bin/bash
if test -d $LFS/sources/coreutils-8.21
 then
  rm -rf $LFS/sources/coreutils-8.21
fi
tar -xJf $LFS/sources/coreutils-8.21.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/coreutils-8.21 &&

./configure --prefix=/tools --enable-install-program=hostname &&
make &&
make RUN_EXPENSIVE_TESTS=yes check
make install