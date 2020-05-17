#!/bin/bash
if test -d $LFS/sources/bzip2-1.0.8
 then
  rm -rf $LFS/sources/bzip2-1.0.8
fi

tar -xzf $LFS/sources/bzip2-1.0.8.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/bzip2-1.0.8 &&

make -f Makefile-libbz2_so &&

make clean &&

make &&

make PREFIX=/tools install &&

cp -v bzip2-shared /tools/bin/bzip2 &&

cp -av libbz2.so* /tools/lib &&

ln -sv libbz2.so.1.0 /tools/lib/libbz2.so 