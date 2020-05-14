#!/bin/bash
if test -d /sources/autoconf-2.69
 then
  rm -rf /sources/autoconf-2.69
fi
tar -xJf /sources/autoconf-2.69.tar.xz -C /sources/ &&
cd /sources/autoconf-2.69 &&
./configure --prefix=/usr &&
make &&
make check &&
make install