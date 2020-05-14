#!/bin/bash
if test -d /sources/tar-1.26
 then
  rm -rf /sources/tar-1.26
fi
tar -xjf /sources/tar-1.26.tar.bz2 -C /sources/ &&
cd /sources/tar-1.26 &&
sed -i -e '/gets is a/d' gnu/stdio.in.h &&
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin \
            --libexecdir=/usr/sbin &&
make &&
make check &&
make install &&
make -C doc install-html docdir=/usr/share/doc/tar-1.26