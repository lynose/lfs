#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bc-3.2.4
 then
  rm -rf /sources/bc-3.2.4
fi

tar -xJf /sources/bc-3.2.4.tar.xz -C /sources/ &&

cd /sources/bc-3.2.4 &&

PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
    make test &&
    ${log} `basename "$0"` " tested" basic
fi

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
