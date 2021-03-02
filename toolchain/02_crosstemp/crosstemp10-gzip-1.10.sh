#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&
if [ -d $LFS/sources/gzip-1.10 ]
 then
  rm -rf $LFS/sources/gzip-1.10
fi
tar xf $LFS/sources/gzip-1.10.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gzip-1.10 &&

./configure --prefix=/usr --host=$LFS_TGT &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
mv -v $LFS/usr/bin/gzip $LFS/bin &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/gzip-1.10 &&
${log} `basename "$0"` " finished" crosstemp
