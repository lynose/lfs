#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/file-5.40
 then
  rm -rf /sources/file-5.40
fi
tar -xzf /sources/file-5.40.tar.gz -C /sources/ &&
cd /sources/file-5.40 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
mv -v /usr/lib/libmagic.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libmagic.so) /usr/lib/libmagic.so &&
${log} `basename "$0"` " installed" basic &&


rm -rf /sources/file-5.40 &&
${log} `basename "$0"` " finished" basic 

