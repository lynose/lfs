#!/bin/bash
if test -d $LFS/sources/findutils-4.4.2
 then
  rm -rf $LFS/sources/findutils-4.4.2
fi
tar -xjf $LFS/sources/findutils-4.4.2.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/findutils-4.4.2 &&

./configure --prefix=/tools &&
make &&
make check &&
make install