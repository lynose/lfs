#!/bin/bash
if test -d /sources/make-3.82
 then
  rm -rf /sources/make-3.82
fi
tar -xjf /sources/make-3.82.tar.bz2 -C /sources/ &&
cd /sources/make-3.82 &&
patch -Np1 -i ../make-3.82-upstream_fixes-2.patch &&
./configure --prefix=/usr &&
make &&
make check &&
make install