#!/bin/bash
if test -d $LFS/sources/gzip-1.10
 then
  rm -rf $LFS/sources/gzip-1.10
fi
tar -xJf $LFS/sources/gzip-1.10.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gzip-1.10 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
