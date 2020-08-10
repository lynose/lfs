#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/ncurses-6.2 ]
 then
  rm -rf $LFS/sources/ncurses-6.2
fi

tar xf $LFS/sources/ncurses-6.2.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/ncurses-6.2 &&

sed -i s/mawk// configure &&

mkdir build &&
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --enable-widec &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install &&
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so &&
mv -v $LFS/usr/lib/libncursesw.so.6* $LFS/lib &&
ln -sfv ../../lib/$(readlink $LFS/usr/lib/libncursesw.so) $LFS/usr/lib/libncursesw.so &&
${log} `basename "$0"` " installed" crosstemp &&
if [ -d $LFS/sources/ncurses-6.2 ]
 then
  rm -rf $LFS/sources/ncurses-6.2
fi
${log} `basename "$0"` " finished" crosstemp
