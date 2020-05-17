#!/bin/bash
if test -d /sources/gmp-6.2.0
 then
  rm -rf /sources/gmp-6.2.0
fi

tar -xJf /sources/gmp-6.2.0.tar.xz -C /sources/ &&

cd /sources/gmp-6.2.0 &&

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.0 &&

make &&
make html &&

make check 2>&1 | tee gmp-check-log &&

awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log &&

make install &&
make install-html
