#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/util-linux-2.35.1
 then
  rm -rf $LFS/sources/util-linux-2.35.1
fi
tar -xJf $LFS/sources/util-linux-2.35.1.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/util-linux-2.35.1 &&

./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            --without-ncurses              \
            PKG_CONFIG=""   &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
