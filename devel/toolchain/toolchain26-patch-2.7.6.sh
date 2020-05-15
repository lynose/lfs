#!/bin/bash
if test -d $LFS/sources/patch-2.7.6
 then
  rm -rf $LFS/sources/patch-2.7.6
fi
tar -xJf $LFS/sources/patch-2.7.6.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/patch-2.7.6 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
