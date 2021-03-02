#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/zlib-1.2.11
 then
  rm -rf /sources/zlib-1.2.11
fi

tar xf /sources/zlib-1.2.11.tar.xz -C /sources/ &&

cd /sources/zlib-1.2.11 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
mv -v /usr/lib/libz.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/zlib-1.2.11
${log} `basename "$0"` " finished" basic 
