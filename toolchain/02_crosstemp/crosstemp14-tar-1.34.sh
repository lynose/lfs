#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/tar-1.34 ]
 then
  rm -rf $LFS/sources/tar-1.34
fi
tar xf $LFS/sources/tar-1.34.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/tar-1.34 &&


./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --bindir=/bin &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/tar-1.34 &&
${log} `basename "$0"` " finished" crosstemp
