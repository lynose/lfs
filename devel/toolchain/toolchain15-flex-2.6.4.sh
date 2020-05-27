#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/flex-2.6.4
 then
  rm -rf $LFS/sources/flex-2.6.4
fi

tar -xzf $LFS/sources/flex-2.6.4.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/flex-2.6.4 &&

./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " checked" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
