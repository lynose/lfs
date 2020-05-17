#!/bin/bash
if test -d /sources/bison-3.6
 then
  rm -rf /sources/bison-3.6
fi
tar -xJf /sources/bison-3.6.tar.xz -C /sources/ &&

cd /sources/bison-3.6 &&

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.6 &&

make &&

make -j1 check &&     # Multi Thread fails in first run, possible race condition
#make check &&      # Would work in the second run

make install
