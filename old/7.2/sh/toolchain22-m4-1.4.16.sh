#!/bin/bash
if test -d $LFS/sources/m4-1.4.16
 then
  rm -rf $LFS/sources/m4-1.4.16
fi
tar -xjf $LFS/sources/m4-1.4.16.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/m4-1.4.16 &&

sed -i -e '/gets is a/d' lib/stdio.in.h &&
./configure --prefix=/tools &&
make &&
make check &&
make install