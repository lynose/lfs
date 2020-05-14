#!/bin/bash
if test -d /sources/patch-2.7.1
 then
  rm -rf /sources/patch-2.7.1
fi

tar -xJf /sources/patch-2.7.1.tar.xz -C /sources/ &&

cd /sources/patch-2.7.1 &&

./configure --prefix=/usr &&

make &&

make check &&

make install