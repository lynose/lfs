#!/bin/bash
if test -d $LFS/sources/file-5.11
 then
  rm -rf $LFS/sources/file-5.11
fi
tar -xzf $LFS/sources/file-5.11.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/file-5.11 &&

./configure --prefix=/tools &&
make &&
make check &&
make install