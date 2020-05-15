#!/bin/bash
if test -d $LFS/sources/grep-3.4
 then
  rm -rf $LFS/sources/grep-3.4
fi
tar -xJf $LFS/sources/grep-3.4.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/grep-3.4 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
