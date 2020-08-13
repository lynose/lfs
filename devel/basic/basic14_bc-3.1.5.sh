#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bc-3.1.5
 then
  rm -rf /sources/bc-3.1.5
fi

tar -xJf /sources/bc-3.1.5.tar.xz -C /sources/ &&

cd /sources/bc-3.1.5 &&

PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make test &&
${log} `basename "$0"` " tested" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
