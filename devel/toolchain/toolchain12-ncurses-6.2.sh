#!/bin/bash
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
make &&
make install &&
ln -s libncursesw.so /tools/lib/libncurses.so
