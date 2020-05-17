#!/bin/bash
if test -d /sources/diffutils-3.7
 then
  rm -rf /sources/diffutils-3.7
fi

tar -xJf /sources/diffutils-3.7.tar.xz -C /sources/ &&

cd /sources/diffutils-3.7 &&

./configure --prefix=/usr &&
make &&
make check &&
make install
