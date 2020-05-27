#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/bc-2.7.2
 then
  rm -rf /sources/bc-2.7.2
fi

tar -xJf /sources/bc-2.7.2.tar.xz -C /sources/ &&

cd /sources/bc-2.7.2 &&

PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make test &&
${log} `basename "$0"` " tested" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
