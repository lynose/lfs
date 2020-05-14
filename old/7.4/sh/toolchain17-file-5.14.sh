#!/bin/bash
if test -d $LFS/sources/file-5.14
 then
  rm -rf $LFS/sources/file-5.14
fi
tar -xzf $LFS/sources/file-5.14.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/file-5.14 &&

./configure --prefix=/tools &&
make &&
make check &&
make install