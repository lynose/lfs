#!/bin/bash
if test -d /sources/mpc-1.1.0
 then
  rm -rf /sources/mpc-1.1.0
fi

tar -xzf /sources/mpc-1.1.0.tar.gz -C /sources &&

cd /sources/mpc-1.1.0 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0 &&
make &&
make html &&

make check &&

make install &&
make install-html
