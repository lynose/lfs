#!/bin/bash
if test -d /sources/flex-2.6.4
 then
  rm -rf /sources/flex-2.6.4
fi
tar -xzf /sources/flex-2.6.4.tar.gz -C /sources/ &&
cd /sources/flex-2.6.4 &&

./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4 &&

make &&

make check &&

make install &&

ln -sv flex /usr/bin/lex

