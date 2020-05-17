#!/bin/bash
if test -d /sources/automake-1.16.2
 then
  rm -rf /sources/automake-1.16.2
fi
tar -xJf /sources/automake-1.16.2.tar.xz -C /sources/ &&
cd /sources/automake-1.16.2 &&

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.2 &&
make &&
make check
make install
