#!/bin/bash
if test -d /sources/diffutils-3.2
 then
  rm -rf /sources/diffutils-3.2
fi
tar -xzf /sources/diffutils-3.2.tar.gz -C /sources/ &&
cd /sources/diffutils-3.2 &&
sed -i -e '/gets is a/d' lib/stdio.in.h &&
./configure --prefix=/usr &&
make &&
make check &&
make install