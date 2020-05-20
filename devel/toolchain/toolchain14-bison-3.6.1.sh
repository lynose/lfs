#!/bin/bash
if test -d $LFS/sources/bison-3.6.1
 then
  rm -rf $LFS/sources/bison-3.6.1
fi

tar -xJf $LFS/sources/bison-3.6.1.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/bison-3.6.1 &&

./configure --prefix=/tools &&

make &&

make check &&

make install 
