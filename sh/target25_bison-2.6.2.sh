#!/bin/bash
if test -d /sources/bison-2.6.2
 then
  rm -rf /sources/bison-2.6.2
fi
tar -xJf /sources/bison-2.6.2.tar.xz -C /sources/ &&
cd /sources/bison-2.6.2 &&
./configure --prefix=/usr &&
echo '#define YYENABLE_NLS 1' >> lib/config.h &&
make &&
make check &&
make install