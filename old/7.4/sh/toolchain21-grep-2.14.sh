#!/bin/bash
if test -d $LFS/sources/grep-2.14
 then
  rm -rf $LFS/sources/grep-2.14
fi
tar -xJf $LFS/sources/grep-2.14.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/grep-2.14 &&

./configure --prefix=/tools &&
make &&
make check &&
make install