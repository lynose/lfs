#!/bin/bash
if test -d /sources/gperf-3.1
 then
  rm -rf /sources/gperf-3.1
fi

tar -xzf /sources/gperf-3.1.tar.gz -C /sources/ &&

cd /sources/gperf-3.1 &&

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1 &&
make &&
make -j1 check &&
make install
