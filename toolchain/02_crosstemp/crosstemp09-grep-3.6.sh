#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&
if [ -d $LFS/sources/grep-3.6 ]
 then
  rm -rf $LFS/sources/grep-3.6
fi

tar xf $LFS/sources/grep-3.6.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/grep-3.6 &&

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/grep-3.6
${log} `basename "$0"` " finished" crosstemp
