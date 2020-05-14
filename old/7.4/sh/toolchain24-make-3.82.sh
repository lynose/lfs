#!/bin/bash
if test -d $LFS/sources/make-3.82
 then
  rm -rf $LFS/sources/make-3.82
fi
tar -xjf $LFS/sources/make-3.82.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/make-3.82 &&

./configure --prefix=/tools &&
make &&
make check &&
make install