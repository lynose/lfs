#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/diffutils-3.7
 then
  rm -rf /sources/diffutils-3.7
fi

tar -xJf /sources/diffutils-3.7.tar.xz -C /sources/ &&

cd /sources/diffutils-3.7 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
