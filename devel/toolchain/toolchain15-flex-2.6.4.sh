#!/bin/bash
if test -d $LFS/sources/flex-2.6.4
 then
  rm -rf $LFS/sources/flex-2.6.4
fi

tar -xzf $LFS/sources/flex-2.6.4.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/flex-2.6.4 &&

./configure --prefix=/tools &&

make &&

make check &&

make install 
