#!/bin/bash
if test -d /sources/libtool-2.4.2
 then
  rm -rf /sources/libtool-2.4.2
fi
tar -xzf /sources/libtool-2.4.2.tar.gz -C /sources/ &&
cd /sources/libtool-2.4.2 &&
./configure --prefix=/usr &&
make &&
make check &&
make install