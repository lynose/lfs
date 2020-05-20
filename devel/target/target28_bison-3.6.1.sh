#!/bin/bash
if test -d /sources/bison-3.6.1
 then
  rm -rf /sources/bison-3.6.1
fi
tar -xJf /sources/bison-3.6.1.tar.xz -C /sources/ &&

cd /sources/bison-3.6.1 &&

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.6.1 &&

make &&

make -j1 check &&   # Multi Thread fails in first run, possible race condition
#make check          # Would work in the second run

make install
