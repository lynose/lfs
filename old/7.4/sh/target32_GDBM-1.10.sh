#!/bin/bash
if test -d /sources/gdbm-1.10
 then
  rm -rf /sources/gdbm-1.10
fi
tar -xzf /sources/gdbm-1.10.tar.gz -C /sources/ &&
cd /sources/gdbm-1.10 &&
./configure --prefix=/usr --enable-libgdbm-compat &&
make &&
make check &&
make install