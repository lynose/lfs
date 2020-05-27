#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/ncurses-6.2
 then
  rm -rf $LFS/sources/ncurses-6.2
fi
tar -xzf $LFS/sources/ncurses-6.2.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/ncurses-6.2 &&

sed -i s/mawk// configure &&

./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make install &&
ln -s libncursesw.so /tools/lib/libncurses.so &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
