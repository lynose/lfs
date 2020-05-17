#!/bin/bash
if test -d /sources/gawk-5.1.0
 then
  rm -rf /sources/gawk-5.1.0
fi

tar -xJf /sources/gawk-5.1.0.tar.xz -C /sources/ &&

cd /sources/gawk-5.1.0 &&

sed -i 's/extras//' Makefile.in &&

./configure --prefix=/usr &&

make &&

make check

make install &&

mkdir -v /usr/share/doc/gawk-5.1.0 &&
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.0
