#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&
if [ -d $LFS/sources/grep-3.4 ]
 then
  rm -rf $LFS/sources/grep-3.4
fi

tar xf $LFS/sources/grep-3.4.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/grep-3.4 &&

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
if [ -d $LFS/sources/grep-3.4 ]
 then
  rm -rf $LFS/sources/grep-3.4
fi
${log} `basename "$0"` " finished" crosstemp
