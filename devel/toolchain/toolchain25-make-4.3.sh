#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/make-4.3
 then
  rm -rf $LFS/sources/make-4.3
fi
tar -xzf $LFS/sources/make-4.3.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/make-4.3 &&

./configure --prefix=/tools --without-guile &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " checked" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
