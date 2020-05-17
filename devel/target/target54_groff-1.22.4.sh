#!/bin/bash
if test -d /sources/groff-1.22.4
 then
  rm -rf /sources/groff-1.22.4
fi

tar -xzf /sources/groff-1.22.4.tar.gz -C /sources/ &&
cd /sources/groff-1.22.4 &&

PAGE=A4 ./configure --prefix=/usr &&
make -j1 &&
make install
