#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/file-5.40 ]
 then
  rm -rf $LFS/sources/file-5.40
fi
tar xf $LFS/sources/file-5.40.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/file-5.40 &&

mkdir build &&
pushd build &&
    ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib &&
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) &&
${log} `basename "$0"` " configured" crosstemp && 

make FILE_COMPILE=$(pwd)/build/src/file &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
mv -v $LFS/usr/lib/libmagic.so.* $LFS/lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libmagic.so) $LFS/usr/lib/libmagic.so &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/file-5.40 &&
${log} `basename "$0"` " finished" crosstemp

