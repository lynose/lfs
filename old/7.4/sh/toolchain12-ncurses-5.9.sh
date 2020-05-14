#!/bin/bash
if test -d $LFS/sources/ncurses-5.9
 then
  rm -rf $LFS/sources/ncurses-5.9
fi
tar -xzf $LFS/sources/ncurses-5.9.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/ncurses-5.9 &&

./configure --prefix=/tools --with-shared \
    --without-debug --without-ada --enable-overwrite &&
make &&
make install
