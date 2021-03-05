#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/pkg-config-0.29.2
 then
  rm -rf /sources/pkg-config-0.29.2
fi
tar -xzf /sources/pkg-config-0.29.2.tar.gz -C /sources/ &&
cd /sources/pkg-config-0.29.2 &&

./configure --prefix=/usr         \
            --with-internal-glib  \
            --disable-host-tool   \
            --docdir=/usr/share/doc/pkg-config-0.29.2 &&
${log} `basename "$0"` " configured" basic &&
make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/pkg-config-0.29.2 &&
${log} `basename "$0"` " finished" basic 
