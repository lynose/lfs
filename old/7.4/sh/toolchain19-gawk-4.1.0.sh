#!/bin/bash
if test -d $LFS/sources/gawk-4.1.0
 then
  rm -rf $LFS/sources/gawk-4.1.0
fi
tar -xJf $LFS/sources/gawk-4.1.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gawk-4.1.0 &&

./configure --prefix=/tools &&
make &&
make check &&
make install