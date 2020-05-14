#!/bin/bash
if test -d $LFS/sources/tar-1.26
 then
  rm -rf $LFS/sources/tar-1.26
fi
tar -xjf $LFS/sources/tar-1.26.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/tar-1.26 &&

sed -i -e '/gets is a/d' gnu/stdio.in.h &&
./configure --prefix=/tools &&
make &&
make check &&
make install