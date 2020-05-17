#!/bin/bash
if test -d /sources/libtool-2.4.6
 then
  rm -rf /sources/libtool-2.4.6
fi
tar -xJf /sources/libtool-2.4.6.tar.xz -C /sources/ &&
cd /sources/libtool-2.4.6 &&
./configure --prefix=/usr &&
make &&
make check 
make install
