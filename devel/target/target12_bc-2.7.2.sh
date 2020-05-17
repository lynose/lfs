#!/bin/bash
if test -d /sources/bc-2.7.2
 then
  rm -rf /sources/bc-2.7.2
fi

tar -xJf /sources/bc-2.7.2.tar.xz -C /sources/ &&

cd /sources/bc-2.7.2 &&

PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3 &&

make &&

make test &&

make install
