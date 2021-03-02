#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/flex-2.6.4
 then
  rm -rf /sources/flex-2.6.4
fi
tar xf /sources/flex-2.6.4.tar.gz -C /sources/ &&
cd /sources/flex-2.6.4 &&

./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
ln -sv flex /usr/bin/lex &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/flex-2.6.4 &&
${log} `basename "$0"` " finished" basic 

