#!/bin/bash
if test -d $LFS/sources/bison-3.6
 then
  rm -rf $LFS/sources/bison-3.6
fi

tar -xJf $LFS/sources/bison-3.6.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/bison-3.6 &&

./configure --prefix=/tools &&

make &&

make check &&

make install 
