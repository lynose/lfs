#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/gdbm-1.18.1
 then
  rm -rf /sources/gdbm-1.18.1
fi

tar -xzf /sources/gdbm-1.18.1.tar.gz -C /sources/ &&

cd /sources/gdbm-1.18.1 &&

sed -r -i '/^char.*parseopt_program_(doc|args)/d' src/parseopt.c &&
./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
