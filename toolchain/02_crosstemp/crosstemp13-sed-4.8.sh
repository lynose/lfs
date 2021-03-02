#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/sed-4.8 ]
 then
  rm -rf $LFS/sources/sed-4.8
fi
tar xf $LFS/sources/sed-4.8.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/sed-4.8 &&

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/sed-4.8 &&
${log} `basename "$0"` " finished" crosstemp
