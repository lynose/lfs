#!/bin/bash
if test -d /sources/file-5.11
 then
  rm -rf /sources/file-5.11
fi
tar -xzf /sources/file-5.11.tar.gz -C /sources/ &&
cd /sources/file-5.11 &&
./configure --prefix=/usr &&
make &&
make check &&
make install
