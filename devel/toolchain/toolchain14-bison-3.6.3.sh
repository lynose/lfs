#!/bin/bash
${log} `basename "$0"` " started" toolchain &&
if test -d $LFS/sources/bison-3.6.3
 then
  rm -rf $LFS/sources/bison-3.6.3
fi

tar -xJf $LFS/sources/bison-3.6.3.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/bison-3.6.3 &&

./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " build" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
