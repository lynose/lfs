#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/sed-4.8
 then
  rm -rf /sources/sed-4.8
fi

tar xf /sources/sed-4.8.tar.xz -C /sources &&

cd /sources/sed-4.8 &&

./configure --prefix=/usr --bindir=/bin &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make html &&
${log} `basename "$0"` " built html doc" basic &&

chown -Rv tester . &&
su tester -c "PATH=$PATH make check" &&
${log} `basename "$0"` " Unexpected Test succeeded" basic
${log} `basename "$0"` " expected test fail?" basic

make install &&
install -d -m755           /usr/share/doc/sed-4.8 &&
install -m644 doc/sed.html /usr/share/doc/sed-4.8 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
