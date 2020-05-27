#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/tar-1.32
 then
  rm -rf /sources/tar-1.32
fi
tar -xJf /sources/tar-1.32.tar.xz -C /sources/ &&

cd /sources/tar-1.32 &&

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
make -C doc install-html docdir=/usr/share/doc/tar-1.32 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

