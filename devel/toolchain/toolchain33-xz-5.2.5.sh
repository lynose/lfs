#!/bin/bash
if test -d $LFS/sources/xz-5.2.5
 then
  rm -rf $LFS/sources/xz-5.2.5
fi
tar -xJf $LFS/sources/xz-5.2.5.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/xz-5.2.5 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
