#!/bin/bash
if test -d /sources/diffutils-3.3
 then
  rm -rf /sources/diffutils-3.3
fi
tar -xJf /sources/diffutils-3.3.tar.xz -C /sources/ &&
cd /sources/diffutils-3.3 &&
sed -i -e '/gets is a/d' lib/stdio.in.h &&
./configure --prefix=/usr &&
make &&
make check &&
make install