#!/bin/bash
if test -d /sources/xz-5.0.5
 then
  rm -rf /sources/xz-5.0.5
fi
tar -xJf /sources/xz-5.0.5.tar.xz -C /sources/ &&
cd /sources/xz-5.0.5 &&
./configure --prefix=/usr --libdir=/lib --docdir=/usr/share/doc/xz-5.0.5 &&
make &&
make check &&
make pkgconfigdir=/usr/lib/pkgconfig install