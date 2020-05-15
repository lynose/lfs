#!/bin/bash
if test -d $LFS/sources/texinfo-6.7
 then
  rm -rf $LFS/sources/texinfo-6.7
fi
tar -xJf $LFS/sources/texinfo-6.7.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/texinfo-6.7 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
