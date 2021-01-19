#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/tar-1.33
 then
  rm -rf /sources/tar-1.33
fi
tar xf /sources/tar-1.33.tar.xz -C /sources/ &&

cd /sources/tar-1.33 &&

FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " unexpected success?" basic
${log} `basename "$0"` " checked" basic &&


make install &&
make -C doc install-html docdir=/usr/share/doc/tar-1.33 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 

