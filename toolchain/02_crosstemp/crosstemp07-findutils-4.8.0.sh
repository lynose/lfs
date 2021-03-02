#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/findutils-4.8.0 ]
 then
  rm -rf $LFS/sources/findutils-4.8.0
fi
tar xf $LFS/sources/findutils-4.8.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/findutils-4.8.0 &&

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
mv -v $LFS/usr/bin/find $LFS/bin &&
sed -i 's|find:=${BINDIR}|find:=/bin|' $LFS/usr/bin/updatedb &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/findutils-4.8.0 &&
${log} `basename "$0"` " finished" crosstemp
