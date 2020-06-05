#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/mpc-1.1.0
 then
  rm -rf /sources/mpc-1.1.0
fi

tar -xzf /sources/mpc-1.1.0.tar.gz -C /sources &&

cd /sources/mpc-1.1.0 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0 &&
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
${log} `basename "$0"` " finished" targetec
