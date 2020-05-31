#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/linux-5.6.15
 then
  rm -rf $LFS/sources/linux-5.6.15
fi

tar -xJf $LFS/sources/linux-5.6.15.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/linux-5.6.15 &&

make mrproper &&

make headers &&
${log} `basename "$0"` " build" toolchain &&
cp -rv usr/include/* /tools/include &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain

