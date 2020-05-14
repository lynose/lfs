#!/bin/bash
if test -d $LFS/sources/diffutils-3.3
 then
  rm -rf $LFS/sources/diffutils-3.3
fi
tar -xJf $LFS/sources/diffutils-3.3.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/diffutils-3.3 &&

./configure --prefix=/tools &&
make &&
make check &&
make install