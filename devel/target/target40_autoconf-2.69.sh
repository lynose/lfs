#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/autoconf-2.69
 then
  rm -rf /sources/autoconf-2.69
fi

tar -xJf /sources/autoconf-2.69.tar.xz -C /sources/ &&

cd /sources/autoconf-2.69 &&

sed '361 s/{/\\{/' -i bin/autoscan.in &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

#make check && #broker by bash-5.0 and libtool-2.4.3
make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target
