#!/bin/bash
if test -d $LFS/sources/tar-1.32
 then
  rm -rf $LFS/sources/tar-1.32
fi
tar -xJf $LFS/sources/tar-1.32.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/tar-1.32 &&


./configure --prefix=/tools &&
make &&
make check &&
make install
