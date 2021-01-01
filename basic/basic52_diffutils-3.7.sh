#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/diffutils-3.7
 then
  rm -rf /sources/diffutils-3.7
fi

tar -xJf /sources/diffutils-3.7.tar.xz -C /sources/ &&

cd /sources/diffutils-3.7 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
