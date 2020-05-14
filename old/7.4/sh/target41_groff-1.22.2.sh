#!/bin/bash
if test -d /sources/groff-1.22.2
 then
  rm -rf /sources/groff-1.22.2
fi
tar -xzf /sources/groff-1.22.2.tar.gz -C /sources/ &&
cd /sources/groff-1.22.2 &&
PAGE=A4 ./configure --prefix=/usr &&
make &&
make install &&
ln -sv eqn /usr/bin/geqn &&
ln -sv tbl /usr/bin/gtbl