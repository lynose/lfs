#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/make-4.3
 then
  rm -rf /sources/make-4.3
fi
tar xf /sources/make-4.3.tar.gz -C /sources/ &&

cd /sources/make-4.3 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/make-4.3 &&
${log} `basename "$0"` " finished" basic 
