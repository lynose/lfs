#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bison-3.7.5
 then
  rm -rf /sources/bison-3.7.5
fi
tar -xJf /sources/bison-3.7.5.tar.xz -C /sources/ &&

cd /sources/bison-3.7.5 &&

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.7.5 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&   # Multi Thread fails in first run, possible race condition
${log} `basename "$0"` " checke successful" basic | 
${log} `basename "$0"` " check failed" basic

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
