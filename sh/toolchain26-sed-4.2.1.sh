#!/bin/bash
if test -d $LFS/sources/sed-4.2.1
 then
  rm -rf $LFS/sources/sed-4.2.1
fi
tar -xjf $LFS/sources/sed-4.2.1.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/sed-4.2.1 &&

./configure --prefix=/tools &&
make &&
make check &&
make install