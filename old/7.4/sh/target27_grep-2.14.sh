#!/bin/bash
if test -d /sources/grep-2.14
 then
  rm -rf /sources/grep-2.14
fi
tar -xJf /sources/grep-2.14.tar.xz -C /sources/ &&
cd /sources/grep-2.14 &&

./configure --prefix=/usr --bindir=/bin &&

make &&

make check &&

make install