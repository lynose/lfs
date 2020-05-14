#!/bin/bash
if test -d /sources/mpfr-3.1.1
 then
  rm -rf /sources/mpfr-3.1.1
fi
tar -xJf /sources/mpfr-3.1.1.tar.xz -C /sources/ &&
cd /sources/mpfr-3.1.1 &&
./configure  --prefix=/usr        \
             --enable-thread-safe \
             --docdir=/usr/share/doc/mpfr-3.1.1 &&
make &&
make check &&
make install &&
make html &&
make install-html