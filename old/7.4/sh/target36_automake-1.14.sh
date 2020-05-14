#!/bin/bash
if test -d /sources/automake-1.14
 then
  rm -rf /sources/automake-1.14
fi
tar -xJf /sources/automake-1.14.tar.xz -C /sources/ &&
cd /sources/automake-1.14 &&
patch -Np1 -i ../automake-1.14-test-1.patch &&
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.14 &&
make &&
#make check &&
make install