#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bc-3.3.0
 then
  rm -rf /sources/bc-3.3.0
fi

tar -xJf /sources/bc-3.3.0.tar.xz -C /sources/ &&

cd /sources/bc-3.3.0 &&

PREFIX=/usr CC=gcc ./configure.sh -G -O3 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&


make test &&
${log} `basename "$0"` " check succeed" blfs_all ||
${log} `basename "$0"` " !!!check failed!!!" blfs_all

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
