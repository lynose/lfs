#!/bin/bash
if test -d /sources/pkg-config-0.27
 then
  rm -rf /sources/pkg-config-0.27
fi
tar -xzf /sources/pkg-config-0.27.tar.gz -C /sources/ &&
cd /sources/pkg-config-0.27 &&
./configure --prefix=/usr         \
            --with-internal-glib  \
            --docdir=/usr/share/doc/pkg-config-0.27 &&
make &&
make check &&
make install