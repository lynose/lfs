#!/bin/bash
if test -d /sources/patch-2.7.6
 then
  rm -rf /sources/patch-2.7.6
fi

tar -xJf /sources/patch-2.7.6.tar.xz -C /sources/ &&

cd /sources/patch-2.7.6 &&

./configure --prefix=/usr &&

make &&

make check &&

make install
