#!/bin/bash
if test -d /sources/findutils-4.7.0
 then
  rm -rf /sources/findutils-4.7.0
fi

tar -xJf /sources/findutils-4.7.0.tar.xz -C /sources/ &&

cd /sources/findutils-4.7.0 &&

./configure --prefix=/usr --localstatedir=/var/lib/locate &&

make &&

make check

make install &&

mv -v /usr/bin/find /bin &&
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb
