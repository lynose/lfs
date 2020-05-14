#!/bin/bash
if test -d /sources/bison-3.0
 then
  rm -rf /sources/bison-3.0
fi
tar -xJf /sources/bison-3.0.tar.xz -C /sources/ &&
cd /sources/bison-3.0 &&

./configure --prefix=/usr &&

make &&

make check &&

make install