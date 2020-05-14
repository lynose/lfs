#!/bin/bash
if test -d $LFS/sources/bzip2-1.0.6
 then
  rm -rf $LFS/sources/bzip2-1.0.6
fi
tar -xjf $LFS/sources/bzip2-1.0.6.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/bzip2-1.0.6 &&

make &&
make PREFIX=/tools install
