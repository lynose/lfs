#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/expect5.45.4
 then
  rm -rf /sources/expect5.45.4
fi

tar xf /sources/expect5.45.4.tar.gz -C /sources/ &&

cd /sources/expect5.45.4 &&

./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include &&
${log} `basename "$0"` " configured" basic &&
   
make &&
${log} `basename "$0"` " build" basic &&

make test &&
${log} `basename "$0"` " tested" basic &&

make install &&
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/expect5.45.4 &&
${log} `basename "$0"` " finished" basic
