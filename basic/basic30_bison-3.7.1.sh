#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bison-3.7.1
 then
  rm -rf /sources/bison-3.7.1
fi
tar -xJf /sources/bison-3.7.1.tar.xz -C /sources/ &&

cd /sources/bison-3.7.1 &&

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.7.1 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&   # Multi Thread fails in first run, possible race condition
${log} `basename "$0"` " checked" basic
${log} `basename "$0"` " unknown result documented" basic &&
#make check          # Would work in the second run

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
