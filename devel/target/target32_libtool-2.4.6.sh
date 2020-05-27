#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/libtool-2.4.6
 then
  rm -rf /sources/libtool-2.4.6
fi

tar -xJf /sources/libtool-2.4.6.tar.xz -C /sources/ &&
cd /sources/libtool-2.4.6 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " unexpected succeeded" target

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
