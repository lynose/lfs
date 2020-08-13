#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gdbm-1.18.1
 then
  rm -rf /sources/gdbm-1.18.1
fi

tar xf /sources/gdbm-1.18.1.tar.gz -C /sources/ &&

cd /sources/gdbm-1.18.1 &&

sed -r -i '/^char.*parseopt_program_(doc|args)/d' src/parseopt.c &&
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
