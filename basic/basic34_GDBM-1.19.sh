#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gdbm-1.19
 then
  rm -rf /sources/gdbm-1.19
fi

tar xf /sources/gdbm-1.19.tar.gz -C /sources/ &&

cd /sources/gdbm-1.19 &&

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

rm -rf /sources/gdbm-1.19 &&
${log} `basename "$0"` " finished" basic 
