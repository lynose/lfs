#!/bin/bash
if test -d $LFS/sources/gzip-1.5
 then
  rm -rf $LFS/sources/gzip-1.5
fi
tar -xJf $LFS/sources/gzip-1.5.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gzip-1.5 &&

./configure --prefix=/tools &&
make &&
make check &&
make install