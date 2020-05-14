#!/bin/bash
if test -d $LFS/sources/gzip-1.6
 then
  rm -rf $LFS/sources/gzip-1.6
fi
tar -xJf $LFS/sources/gzip-1.6.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gzip-1.6 &&

./configure --prefix=/tools &&
make &&
make check &&
make install