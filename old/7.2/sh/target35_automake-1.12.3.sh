#!/bin/bash
if test -d /sources/automake-1.12.3
 then
  rm -rf /sources/automake-1.12.3
fi
tar -xJf /sources/automake-1.12.3.tar.xz -C /sources/ &&
cd /sources/automake-1.12.3 &&
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.12.3 &&
make &&
make check
make install