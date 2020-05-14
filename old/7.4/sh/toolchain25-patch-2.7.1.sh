#!/bin/bash
if test -d $LFS/sources/patch-2.7.1
 then
  rm -rf $LFS/sources/patch-2.7.1
fi
tar -xJf $LFS/sources/patch-2.7.1.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/patch-2.7.1 &&

./configure --prefix=/tools &&
make &&
make check &&
make install