#!/bin/bash
if test -d /sources/zlib-1.2.7
 then
  rm -rf /sources/zlib-1.2.7
fi
tar -xjf /sources/zlib-1.2.7.tar.bz2 -C /sources/ &&
cd /sources/zlib-1.2.7 &&
./configure --prefix=/usr &&
make &&
make check &&
make install &&
mv -v /usr/lib/libz.so.* /lib &&
ln -sfv ../../lib/libz.so.1.2.7 /usr/lib/libz.so