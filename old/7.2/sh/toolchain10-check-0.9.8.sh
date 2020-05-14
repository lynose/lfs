#!/bin/bash
if test -d $LFS/sources/check-0.9.8
 then
  rm -rf $LFS/sources/check-0.9.8
fi
tar -xzf $LFS/sources/check-0.9.8.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/check-0.9.8 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
