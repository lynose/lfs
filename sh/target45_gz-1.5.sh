#!/bin/bash
if test -d /sources/gzip-1.5
 then
  rm -rf /sources/gzip-1.5
fi
tar -xJf /sources/gzip-1.5.tar.xz -C /sources/ &&
cd /sources/gzip-1.5 &&
./configure --prefix=/usr --bindir=/bin &&
make &&
make check &&
make install &&
mv -v /bin/{gzexe,uncompress,zcmp,zdiff,zegrep} /usr/bin &&
mv -v /bin/{zfgrep,zforce,zgrep,zless,zmore,znew} /usr/bin