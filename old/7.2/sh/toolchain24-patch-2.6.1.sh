#!/bin/bash
if test -d $LFS/sources/patch-2.6.1
 then
  rm -rf $LFS/sources/patch-2.6.1
fi
tar -xjf $LFS/sources/patch-2.6.1.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/patch-2.6.1 &&

./configure --prefix=/tools &&
make &&
make check &&
make install