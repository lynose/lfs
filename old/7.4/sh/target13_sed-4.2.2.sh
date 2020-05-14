#!/bin/bash
if test -d /sources/sed-4.2.2
 then
  rm -rf /sources/sed-4.2.2
fi
tar -xjf /sources/sed-4.2.2.tar.bz2 -C /sources &&
cd /sources/sed-4.2.2 &&

./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.2 &&

make &&

make html &&

make check &&

make install &&

make -C doc install-html