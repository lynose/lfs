#!/bin/bash
${log} `basename "$0"` " started" target &&
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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make html &&
${log} `basename "$0"` " built doc" target &&

make check 2>&1 | tee gmp-check-log &&
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log &&
${log} `basename "$0"` " checked" target &&

make install &&
make install-html &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
