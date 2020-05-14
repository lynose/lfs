#!/bin/bash
if test -d $LFS/sources/dejagnu-1.5.1
 then
  rm -rf $LFS/sources/dejagnu-1.5.1
fi
tar -xzf $LFS/sources/dejagnu-1.5.1.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/dejagnu-1.5.1 &&

./configure --prefix=/tools &&
make install &&
make check