#!/bin/bash
if test -d /sources/groff-1.21
 then
  rm -rf /sources/groff-1.21
fi
tar -xjf /sources/groff-1.21.tar.bz2 -C /sources/ &&
cd /sources/groff-1.21 &&
PAGE=A4 ./configure --prefix=/usr &&
make &&
make install &&
ln -sv eqn /usr/bin/geqn &&
ln -sv tbl /usr/bin/gtbl