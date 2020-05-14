#!/bin/bash
if test -d $LFS/sources/texinfo-4.13
 then
  rm -rf $LFS/sources/texinfo-4.13
fi
tar -xjf $LFS/sources/texinfo-4.13a.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/texinfo-4.13 &&

./configure --prefix=/tools &&
make &&
make check &&
make install