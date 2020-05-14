#!/bin/bash
if test -d /sources/gettext-0.18.1.1
 then
  rm -rf /sources/gettext-0.18.1.1
fi
tar -xjf /sources/gettext-0.18.1.1.tar.bz2 -C /sources/ &&
cd /sources/gettext-0.18.1.1 &&
sed -i -e '/gets is a/d' gettext-*/*/stdio.in.h &&
./configure --prefix=/usr \
            --docdir=/usr/share/doc/gettext-0.18.1.1 &&
make &&
make check &&
make install
