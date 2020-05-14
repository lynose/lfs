#!/bin/bash
if test -d /sources/mpc-1.0
 then
  rm -rf /sources/mpc-1.0
fi
tar -xzf /sources/mpc-1.0.tar.gz -C /sources &&
cd /sources/mpc-1.0 &&
./configure  --prefix=/usr &&
make &&
make check &&
make install
