#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/flex-2.6.4
 then
  rm -rf /sources/flex-2.6.4
fi
tar -xzf /sources/flex-2.6.4.tar.gz -C /sources/ &&
cd /sources/flex-2.6.4 &&

./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
ln -sv flex /usr/bin/lex &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

