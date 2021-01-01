#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/patch-2.7.6 ]
 then
  rm -rf $LFS/sources/patch-2.7.6
fi
tar xf $LFS/sources/patch-2.7.6.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/patch-2.7.6 &&

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp && 

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
${log} `basename "$0"` " finished" crosstemp
