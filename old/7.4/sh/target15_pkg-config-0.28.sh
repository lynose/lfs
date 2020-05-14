#!/bin/bash
if test -d /sources/pkg-config-0.28
 then
  rm -rf /sources/pkg-config-0.28
fi
tar -xzf /sources/pkg-config-0.28.tar.gz -C /sources/ &&
cd /sources/pkg-config-0.28 &&
./configure --prefix=/usr         \
            --with-internal-glib  \
            --disable-host-tool   \
            --docdir=/usr/share/doc/pkg-config-0.28 &&
make &&
make check &&
make install