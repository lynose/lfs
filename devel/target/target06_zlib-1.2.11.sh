#!/bin/bash
if test -d /sources/zlib-1.2.11
 then
  rm -rf /sources/zlib-1.2.11
fi

tar -xJf /sources/zlib-1.2.11.tar.xz -C /sources/ &&

cd /sources/zlib-1.2.11 &&

./configure --prefix=/usr &&

make &&

make check &&

make install &&

mv -v /usr/lib/libz.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so
