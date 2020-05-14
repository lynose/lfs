#!/bin/bash
if test -d $LFS/sources/check-0.9.10
 then
  rm -rf $LFS/sources/check-0.9.10
fi
tar -xzf $LFS/sources/check-0.9.10.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/check-0.9.10 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
