#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/gperf-3.1
 then
  rm -rf /sources/gperf-3.1
fi

tar -xzf /sources/gperf-3.1.tar.gz -C /sources/ &&

cd /sources/gperf-3.1 &&

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make -j1 check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target
