#!/bin/bash
if test -d /sources/gzip-1.6
 then
  rm -rf /sources/gzip-1.6
fi
tar -xJf /sources/gzip-1.6.tar.xz -C /sources/ &&
cd /sources/gzip-1.6 &&
./configure --prefix=/usr --bindir=/bin &&
make &&
make check &&
make install &&
mv -v /bin/{gzexe,uncompress,zcmp,zdiff,zegrep} /usr/bin &&
mv -v /bin/{zfgrep,zforce,zgrep,zless,zmore,znew} /usr/bin