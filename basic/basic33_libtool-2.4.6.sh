#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/libtool-2.4.6
 then
  rm -rf /sources/libtool-2.4.6
fi

tar -xJf /sources/libtool-2.4.6.tar.xz -C /sources/ &&
cd /sources/libtool-2.4.6 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " unexpected succeeded" basic

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/libtool-2.4.6 &&
${log} `basename "$0"` " finished" basic 
