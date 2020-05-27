#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/bzip2-1.0.8
 then
  rm -rf $LFS/sources/bzip2-1.0.8
fi

tar -xzf $LFS/sources/bzip2-1.0.8.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/bzip2-1.0.8 &&

make -f Makefile-libbz2_so &&
${log} `basename "$0"` " build shared" toolchain &&

make clean &&
${log} `basename "$0"` " cleaned" toolchain &&

make &&
${log} `basename "$0"` " build static" toolchain &&

make PREFIX=/tools install &&

cp -v bzip2-shared /tools/bin/bzip2 &&

cp -av libbz2.so* /tools/lib &&

ln -sv libbz2.so.1.0 /tools/lib/libbz2.so &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
