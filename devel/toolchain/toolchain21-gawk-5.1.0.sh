#!/bin/bash
${log} `basename "$0"` " started" toolchain &&
if test -d $LFS/sources/gawk-5.1.0
 then
  rm -rf $LFS/sources/gawk-5.1.0
fi
tar -xJf $LFS/sources/gawk-5.1.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gawk-5.1.0 &&

./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " unexpected checked successful" toolchain
${log} `basename "$0"` " expected check failed" toolchain &&
make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
