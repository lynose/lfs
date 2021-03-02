#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/patch-2.7.6
 then
  rm -rf /sources/patch-2.7.6
fi

tar xf /sources/patch-2.7.6.tar.xz -C /sources/ &&

cd /sources/patch-2.7.6 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/patch-2.7.6 &&
${log} `basename "$0"` " finished" basic 
