#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/make-4.3 ]
 then
  rm -rf $LFS/sources/make-4.3
fi
tar xf $LFS/sources/make-4.3.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/make-4.3 &&

./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
if [ -d $LFS/sources/make-4.3 ]
 then
  rm -rf $LFS/sources/make-4.3
fi
${log} `basename "$0"` " finished" crosstemp
