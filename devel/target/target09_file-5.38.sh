#!/bin/bash
if test -d /sources/file-5.38
 then
  rm -rf /sources/file-5.38
fi
tar -xzf /sources/file-5.38.tar.gz -C /sources/ &&
cd /sources/file-5.38 &&
./configure --prefix=/usr &&
make &&
make check &&
make install
