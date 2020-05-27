#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/zlib-1.2.11
 then
  rm -rf /sources/zlib-1.2.11
fi

tar -xJf /sources/zlib-1.2.11.tar.xz -C /sources/ &&

cd /sources/zlib-1.2.11 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
mv -v /usr/lib/libz.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
