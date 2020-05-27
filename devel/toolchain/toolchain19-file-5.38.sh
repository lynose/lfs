#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/file-5.38
 then
  rm -rf $LFS/sources/file-5.38
fi
tar -xzf $LFS/sources/file-5.38.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/file-5.38 &&

./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain && 

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " checked" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain

