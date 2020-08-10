#!/bin/bash
${log} `basename "$0"` " started" crosstools &&

if [ -d $LFS/sources/linux-5.7.12 ]
 then
  rm -rf $LFS/sources/linux-5.7.12
fi
tar xf $LFS/sources/linux-5.7.12.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/linux-5.7.12 &&

make mrproper &&

make headers &&
find usr/include -name '.*' -delete &&
rm usr/include/Makefile &&

${log} `basename "$0"` " build" crosstools &&
cp -rv usr/include $LFS/usr &&
${log} `basename "$0"` " installed" crosstools &&

if [ -d $LFS/sources/linux-5.7.12 ]
 then
  rm -rf $LFS/sources/linux-5.7.12
fi
${log} `basename "$0"` " finished" crosstools

