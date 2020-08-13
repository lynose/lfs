#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/mpc-1.1.0
 then
  rm -rf /sources/mpc-1.1.0
fi

tar xf /sources/mpc-1.1.0.tar.gz -C /sources &&

cd /sources/mpc-1.1.0 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0 &&
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
