#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/autoconf-2.71
 then
  rm -rf /sources/autoconf-2.71
fi

tar xf /sources/autoconf-2.71.tar.xz -C /sources/ &&

cd /sources/autoconf-2.71 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " unexpected check succeed" basic
${log} `basename "$0"` " expected check fail?" basic

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/autoconf-2.71 &&
${log} `basename "$0"` " finished" basic
