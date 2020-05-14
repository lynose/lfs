#!/bin/bash
if test -d /sources/mpc-1.0.1
 then
  rm -rf /sources/mpc-1.0.1
fi
tar -xzf /sources/mpc-1.0.1.tar.gz -C /sources &&
cd /sources/mpc-1.0.1 &&
./configure  --prefix=/usr &&
make &&
make check &&
make install
