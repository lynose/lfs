#!/bin/bash
if test -d $LFS/sources/file-5.38
 then
  rm -rf $LFS/sources/file-5.38
fi
tar -xzf $LFS/sources/file-5.38.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/file-5.38 &&

./configure --prefix=/tools &&
make &&
make check &&
make install
