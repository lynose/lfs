#!/bin/bash
if test -d $LFS/sources/make-4.3
 then
  rm -rf $LFS/sources/make-4.3
fi
tar -xzf $LFS/sources/make-4.3.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/make-4.3 &&

./configure --prefix=/tools --without-guile &&
make &&
make check &&
make install
