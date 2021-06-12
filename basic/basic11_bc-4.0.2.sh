#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bc-4.0.2
 then
  rm -rf /sources/bc-4.0.2
fi

tar -xJf /sources/bc-4.0.2.tar.xz -C /sources/ &&

cd /sources/bc-4.0.2 &&

CC=gcc ./configure --prefix=/usr -G -O3 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&


make test &&
${log} `basename "$0"` " check succeed" blfs_all ||
${log} `basename "$0"` " !!!check failed!!!" blfs_all

make install &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/bc-4.0.2 &&
${log} `basename "$0"` " finished" basic 