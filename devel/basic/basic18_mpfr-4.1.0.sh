#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/mpfr-4.1.0
 then
  rm -rf /sources/mpfr-4.1.0
fi
tar -xJf /sources/mpfr-4.1.0.tar.xz -C /sources/ &&
cd /sources/mpfr-4.1.0 &&

./configure  --prefix=/usr        \
             --enable-thread-safe \
             --docdir=/usr/share/doc/mpfr-4.1.0 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make html &&
${log} `basename "$0"` " built doc" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
make install-html &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
