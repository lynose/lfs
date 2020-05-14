#!/bin/bash
if test -d $LFS/sources/bzip2-1.0.6
 then
  rm -rf $LFS/sources/bzip2-1.0.6
fi
tar -xzf $LFS/sources/bzip2-1.0.6.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/bzip2-1.0.6 &&

make &&
make PREFIX=/tools install
