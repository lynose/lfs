#!/bin/bash
if test -d $LFS/sources/dejagnu-1.6.2
 then
  rm -rf $LFS/sources/dejagnu-1.6.2
fi
tar -xzf $LFS/sources/dejagnu-1.6.2.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/dejagnu-1.6.2 &&

./configure --prefix=/tools &&
make install &&
make check
