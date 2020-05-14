#!/bin/bash
if test -d $LFS/sources/xz-5.0.4
 then
  rm -rf $LFS/sources/xz-5.0.4
fi
tar -xJf $LFS/sources/xz-5.0.4.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/xz-5.0.4 &&

./configure --prefix=/tools &&
make &&
make check &&
make install