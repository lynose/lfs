#!/bin/bash
if test -d /sources/gettext-0.18.3
 then
  rm -rf /sources/gettext-0.18.3
fi
tar -xzf /sources/gettext-0.18.3.tar.gz -C /sources/ &&
cd /sources/gettext-0.18.3 &&
./configure --prefix=/usr \
            --docdir=/usr/share/doc/gettext-0.18.3 &&
make &&
make check &&
make install
