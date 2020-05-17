#!/bin/bash
if test -d /sources/grep-3.4
 then
  rm -rf /sources/grep-3.4
fi
tar -xJf /sources/grep-3.4.tar.xz -C /sources/ &&
cd /sources/grep-3.4 &&

./configure --prefix=/usr --bindir=/bin &&

make &&

make check &&

make install
