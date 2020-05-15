#!/bin/bash
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
make &&
make install
