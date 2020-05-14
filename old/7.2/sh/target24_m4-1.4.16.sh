#!/bin/bash
if test -d /sources/m4-1.4.16
 then
  rm -rf /sources/m4-1.4.16
fi
tar -xjf /sources/m4-1.4.16.tar.bz2 -C /sources/ &&
cd /sources/m4-1.4.16 &&
sed -i -e '/gets is a/d' lib/stdio.in.h &&
./configure --prefix=/usr &&
make &&
sed -i -e '41s/ENOENT/& || errno == EINVAL/' tests/test-readlink.h &&
make check &&
make install