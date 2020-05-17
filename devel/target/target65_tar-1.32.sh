#!/bin/bash
if test -d /sources/tar-1.32
 then
  rm -rf /sources/tar-1.32
fi
tar -xJf /sources/tar-1.32.tar.xz -C /sources/ &&

cd /sources/tar-1.32 &&

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin &&

make &&

make check &&

make install &&
make -C doc install-html docdir=/usr/share/doc/tar-1.32

