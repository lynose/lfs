#!/bin/bash
${log} `basename "$0"` " started" target &&
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
${log} `basename "$0"` " configured" target &&
make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
