#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/autoconf-2.69
 then
  rm -rf /sources/autoconf-2.69
fi

tar xf /sources/autoconf-2.69.tar.xz -C /sources/ &&

cd /sources/autoconf-2.69 &&

sed '361 s/{/\\{/' -i bin/autoscan.in &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

#make check && #broker by bash-5.0 and libtool-2.4.3
make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic
