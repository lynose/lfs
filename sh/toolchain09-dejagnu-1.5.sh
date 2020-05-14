#!/bin/bash
if test -d $LFS/sources/dejagnu-1.5
 then
  rm -rf $LFS/sources/dejagnu-1.5
fi
tar -xzf $LFS/sources/dejagnu-1.5.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/dejagnu-1.5 &&

./configure --prefix=/tools &&
make &&
make install &&
make check