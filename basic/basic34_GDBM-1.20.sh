#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gdbm-1.20
 then
  rm -rf /sources/gdbm-1.20
fi

tar xf /sources/gdbm-1.20.tar.gz -C /sources/ &&

cd /sources/gdbm-1.20 &&

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&


make check &&
${log} `basename "$0"` " checked" basic

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/gdbm-1.20 &&
${log} `basename "$0"` " finished" basic 
