#!/bin/bash
if test -d /sources/file-5.14
 then
  rm -rf /sources/file-5.14
fi
tar -xzf /sources/file-5.14.tar.gz -C /sources/ &&
cd /sources/file-5.14 &&
./configure --prefix=/usr &&
make &&
make check &&
make install
