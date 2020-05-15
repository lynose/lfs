#!/bin/bash
if test -d $LFS/sources/diffutils-3.7
 then
  rm -rf $LFS/sources/diffutils-3.7
fi
tar -xJf $LFS/sources/diffutils-3.7.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/diffutils-3.7 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
