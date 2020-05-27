#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/grep-3.4
 then
  rm -rf /sources/grep-3.4
fi
tar -xJf /sources/grep-3.4.tar.xz -C /sources/ &&
cd /sources/grep-3.4 &&

./configure --prefix=/usr --bindir=/bin &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
