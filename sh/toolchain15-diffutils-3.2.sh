#!/bin/bash
if test -d $LFS/sources/diffutils-3.2
 then
  rm -rf $LFS/sources/diffutils-3.2
fi
tar -xzf $LFS/sources/diffutils-3.2.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/diffutils-3.2 &&

sed -i -e '/gets is a/d' lib/stdio.in.h &&
./configure --prefix=/tools &&
make &&
make check &&
make install