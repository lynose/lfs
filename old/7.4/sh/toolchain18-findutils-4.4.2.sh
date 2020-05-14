#!/bin/bash
if test -d $LFS/sources/findutils-4.4.2
 then
  rm -rf $LFS/sources/findutils-4.4.2
fi
tar -xzf $LFS/sources/findutils-4.4.2.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/findutils-4.4.2 &&

./configure --prefix=/tools &&
make &&
make check &&
make install