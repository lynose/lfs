#!/bin/bash
${log} `basename "$0"` " started" roottools &&
if test -d /sources/bison-3.7.4
 then
  rm -rf /sources/bison-3.7.4
fi

tar -xJf /sources/bison-3.7.4.tar.xz -C /sources/ &&

cd /sources/bison-3.7.4 &&

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.7.4 &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&
${log} `basename "$0"` " finished" roottools