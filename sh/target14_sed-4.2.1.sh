#!/bin/bash
if test -d /sources/sed-4.2.1
 then
  rm -rf /sources/sed-4.2.1
fi
tar -xjf /sources/sed-4.2.1.tar.bz2 -C /sources &&
cd /sources/sed-4.2.1 &&
patch -Np1 -i ../sed-4.2.1-testsuite_fixes-1.patch &&
./configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/sed-4.2.1 &&
make &&
make html &&
make check &&
make install &&
make -C doc install-html