#!/bin/bash
${log} `basename "$0"` " started" basic &&
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
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make html &&
${log} `basename "$0"` " built doc" basic &&

make check 2>&1 | tee gmp-check-log &&
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log &&
${log} `basename "$0"` " checked" basic &&

make install &&
make install-html &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
