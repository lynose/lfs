#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&
if [ -d $LFS/sources/xz-5.2.5 ]
 then
  rm -rf $LFS/sources/xz-5.2.5
fi
tar xf $LFS/sources/xz-5.2.5.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/xz-5.2.5 &&

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5 &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
mv -v $LFS/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat}  $LFS/bin &&
mv -v $LFS/usr/lib/liblzma.so.*                       $LFS/lib &&
ln -svf ../../lib/$(readlink $LFS/usr/lib/liblzma.so) $LFS/usr/lib/liblzma.so &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/xz-5.2.5 &&
${log} `basename "$0"` " finished" crosstemp
