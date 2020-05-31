#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/bison-3.6.2
 then
  rm -rf /sources/bison-3.6.2
fi
tar -xJf /sources/bison-3.6.2.tar.xz -C /sources/ &&

cd /sources/bison-3.6.2 &&

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.6.2 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make -j1 check &&   # Multi Thread fails in first run, possible race condition
${log} `basename "$0"` " checked" target &&
#make check          # Would work in the second run

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
