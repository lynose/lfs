#!/bin/bash
if test -d /sources/sed-4.8
 then
  rm -rf /sources/sed-4.8
fi

tar -xJf /sources/sed-4.8.tar.xz -C /sources &&

cd /sources/sed-4.8 &&

sed -i 's/usr/tools/'                 build-aux/help2man &&
sed -i 's/testsuite.panic-tests.sh//' Makefile.in &&


./configure --prefix=/usr --bindir=/bin &&

make &&
make html &&

make check &&

make install &&
install -d -m755           /usr/share/doc/sed-4.8 &&
install -m644 doc/sed.html /usr/share/doc/sed-4.8
