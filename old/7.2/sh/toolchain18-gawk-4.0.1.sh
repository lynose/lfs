#!/bin/bash
if test -d $LFS/sources/gawk-4.0.1
 then
  rm -rf $LFS/sources/gawk-4.0.1
fi
tar -xJf $LFS/sources/gawk-4.0.1.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gawk-4.0.1 &&

./configure --prefix=/tools &&
make &&
make check &&
make install