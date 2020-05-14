#!/bin/bash
if test -d /sources/xz-5.0.4
 then
  rm -rf /sources/xz-5.0.4
fi
tar -xJf /sources/xz-5.0.4.tar.xz -C /sources/ &&
cd /sources/xz-5.0.4 &&
./configure --prefix=/usr --libdir=/lib --docdir=/usr/share/doc/xz-5.0.4 &&
make &&
make check &&
make pkgconfigdir=/usr/lib/pkgconfig install