#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gperf-3.1
 then
  rm -rf /sources/gperf-3.1
fi

tar xf /sources/gperf-3.1.tar.gz -C /sources/ &&

cd /sources/gperf-3.1 &&

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make -j1 check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic
