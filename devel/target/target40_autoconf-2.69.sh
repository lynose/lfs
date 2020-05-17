#!/bin/bash
if test -d /sources/autoconf-2.69
 then
  rm -rf /sources/autoconf-2.69
fi

tar -xJf /sources/autoconf-2.69.tar.xz -C /sources/ &&

cd /sources/autoconf-2.69 &&

sed '361 s/{/\\{/' -i bin/autoscan.in &&

./configure --prefix=/usr &&
make &&
#make check && #broker by bash-5.0 and libtool-2.4.3
make install
