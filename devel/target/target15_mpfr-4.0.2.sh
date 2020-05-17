#!/bin/bash
if test -d /sources/mpfr-4.0.2
 then
  rm -rf /sources/mpfr-4.0.2
fi
tar -xJf /sources/mpfr-4.0.2.tar.xz -C /sources/ &&
cd /sources/mpfr-4.0.2 &&
./configure  --prefix=/usr        \
             --enable-thread-safe \
             --docdir=/usr/share/doc/mpfr-4.0.2 &&
make &&
make html &&

make check &&

make install &&
make install-html
