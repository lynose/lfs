#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/diffutils-3.7 ]
 then
  rm -rf $LFS/sources/diffutils-3.7
fi

tar xf $LFS/sources/diffutils-3.7.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/diffutils-3.7 &&

./configure --prefix=/usr --host=$LFS_TGT &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
if [ -d $LFS/sources/diffutils-3.7 ]
 then
  rm -rf $LFS/sources/diffutils-3.7
fi
${log} `basename "$0"` " finished" crosstemp
