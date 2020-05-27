#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/automake-1.16.2
 then
  rm -rf /sources/automake-1.16.2
fi
tar -xJf /sources/automake-1.16.2.tar.xz -C /sources/ &&
cd /sources/automake-1.16.2 &&

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.2 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&
make check &&
${log} `basename "$0"` " unexpected test succeed" target
${log} `basename "$0"` " expected test fail?" target
make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
