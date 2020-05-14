#!/bin/bash
if test -d /sources/zlib-1.2.8
 then
  rm -rf /sources/zlib-1.2.8
fi
tar -xJf /sources/zlib-1.2.8.tar.xz -C /sources/ &&
cd /sources/zlib-1.2.8 &&
./configure --prefix=/usr &&
make &&
make check &&
make install &&
mv -v /usr/lib/libz.so.* /lib &&
ln -sfv ../../lib/libz.so.1.2.8 /usr/lib/libz.so