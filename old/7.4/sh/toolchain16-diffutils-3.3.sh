#!/bin/bash
if test -d $LFS/sources/diffutils-3.8
 then
  rm -rf $LFS/sources/diffutils-3.8
fi
tar -xJf $LFS/sources/diffutils-3.8.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/diffutils-3.8 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
