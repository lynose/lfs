#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/gawk-5.1.0
 then
  rm -rf /sources/gawk-5.1.0
fi

tar -xJf /sources/gawk-5.1.0.tar.xz -C /sources/ &&

cd /sources/gawk-5.1.0 &&

sed -i 's/extras//' Makefile.in &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check failed?" target

make install &&
mkdir -v /usr/share/doc/gawk-5.1.0 &&
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.0 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
