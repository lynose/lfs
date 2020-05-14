#!/bin/bash
if test -d $LFS/sources/texinfo-5.1
 then
  rm -rf $LFS/sources/texinfo-5.1
fi
tar -xJf $LFS/sources/texinfo-5.1.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/texinfo-5.1 &&

./configure --prefix=/tools &&
make &&
make check 
make install