#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/gzip-1.10
 then
  rm -rf /sources/gzip-1.10
fi

tar -xJf /sources/gzip-1.10.tar.xz -C /sources/ &&

cd /sources/gzip-1.10 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check fail?" target

make install &&
mv -v /usr/bin/gzip /bin &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

