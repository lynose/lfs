#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/mpfr-4.0.2
 then
  rm -rf /sources/mpfr-4.0.2
fi
tar -xJf /sources/mpfr-4.0.2.tar.xz -C /sources/ &&
cd /sources/mpfr-4.0.2 &&

./configure  --prefix=/usr        \
             --enable-thread-safe \
             --docdir=/usr/share/doc/mpfr-4.0.2 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make html &&
${log} `basename "$0"` " built doc" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
make install-html &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
