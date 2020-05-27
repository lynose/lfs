#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/patch-2.7.6
 then
  rm -rf /sources/patch-2.7.6
fi

tar -xJf /sources/patch-2.7.6.tar.xz -C /sources/ &&

cd /sources/patch-2.7.6 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
