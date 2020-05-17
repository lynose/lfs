#!/bin/bash
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
make &&
make check &&
make install
