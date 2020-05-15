#!/bin/bash
if test -d $LFS/sources/findutils-4.7.0
 then
  rm -rf $LFS/sources/findutils-4.7.0
fi
tar -xJf $LFS/sources/findutils-4.7.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/findutils-4.7.0 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
