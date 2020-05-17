#!/bin/bash
if test -d /sources/gzip-1.10
 then
  rm -rf /sources/gzip-1.10
fi

tar -xJf /sources/gzip-1.10.tar.xz -C /sources/ &&

cd /sources/gzip-1.10 &&

./configure --prefix=/usr &&

make &&

make check

make install &&
mv -v /usr/bin/gzip /bin
