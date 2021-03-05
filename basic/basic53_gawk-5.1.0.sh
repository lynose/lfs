#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gawk-5.1.0
 then
  rm -rf /sources/gawk-5.1.0
fi

tar xf /sources/gawk-5.1.0.tar.xz -C /sources/ &&

cd /sources/gawk-5.1.0 &&

sed -i 's/extras//' Makefile.in &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " unexpected check succeed" basic
${log} `basename "$0"` " expected check failed?" basic

make install &&
mkdir -v /usr/share/doc/gawk-5.1.0 &&
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.0 &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/gawk-5.1.0 &&
${log} `basename "$0"` " finished" basic 
