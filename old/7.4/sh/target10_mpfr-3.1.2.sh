#!/bin/bash
if test -d /sources/mpfr-3.1.2
 then
  rm -rf /sources/mpfr-3.1.2
fi
tar -xJf /sources/mpfr-3.1.2.tar.xz -C /sources/ &&
cd /sources/mpfr-3.1.2 &&
./configure  --prefix=/usr        \
             --enable-thread-safe \
             --docdir=/usr/share/doc/mpfr-3.1.2 &&
make &&

make check &&

make install &&

make html &&

make install-html