#!/bin/bash
if test -d $LFS/sources/sed-4.8
 then
  rm -rf $LFS/sources/sed-4.8
fi
tar -xJf $LFS/sources/sed-4.8.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/sed-4.8 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
