#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&
if [ -d $LFS/sources/gawk-5.1.0 ]
 then
  rm -rf $LFS/sources/gawk-5.1.0
fi
tar xf $LFS/sources/gawk-5.1.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/gawk-5.1.0 &&

sed -i 's/extras//' Makefile.in &&
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./config.guess) &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
if [ -d $LFS/sources/gawk-5.1.0 ]
 then
  rm -rf $LFS/sources/gawk-5.1.0
fi
${log} `basename "$0"` " finished" crosstemp
