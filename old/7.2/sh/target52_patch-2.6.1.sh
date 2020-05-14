#!/bin/bash
if test -d /sources/patch-2.6.1
 then
  rm -rf /sources/patch-2.6.1
fi
tar -xjf /sources/patch-2.6.1.tar.bz2 -C /sources/ &&
cd /sources/patch-2.6.1 &&
patch -Np1 -i ../patch-2.6.1-test_fix-1.patch &&
./configure --prefix=/usr &&
make &&
make -k check &&
make install