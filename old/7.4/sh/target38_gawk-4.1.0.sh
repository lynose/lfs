#!/bin/bash
if test -d /sources/gawk-4.1.0
 then
  rm -rf /sources/gawk-4.1.0
fi
tar -xJf /sources/gawk-4.1.0.tar.xz -C /sources/ &&
cd /sources/gawk-4.1.0 &&
./configure --prefix=/usr --libexecdir=/usr/lib &&
make &&
make check &&
make install &&
mkdir -v /usr/share/doc/gawk-4.1.0 &&
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.1.0