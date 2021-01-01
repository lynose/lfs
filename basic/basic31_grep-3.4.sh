#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/grep-3.4
 then
  rm -rf /sources/grep-3.4
fi
tar -xJf /sources/grep-3.4.tar.xz -C /sources/ &&
cd /sources/grep-3.4 &&

./configure --prefix=/usr --bindir=/bin &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
