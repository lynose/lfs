#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/dejagnu-1.6.2
 then
  rm -rf $LFS/sources/dejagnu-1.6.2
fi
tar -xzf $LFS/sources/dejagnu-1.6.2.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/dejagnu-1.6.2 &&

./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&

make check &&
${log} `basename "$0"` " checked" toolchain &&
${log} `basename "$0"` " finished" toolchain
