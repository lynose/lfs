#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/file-5.39 ]
 then
  rm -rf $LFS/sources/file-5.39
fi
tar xf $LFS/sources/file-5.39.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/file-5.39 &&

mkdir build 
pushd build
  ../configure
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) &&
${log} `basename "$0"` " configured" crosstemp && 

make FILE_COMPILE=$(pwd)/build/src/file &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/file-5.39 &&
${log} `basename "$0"` " finished" crosstemp

