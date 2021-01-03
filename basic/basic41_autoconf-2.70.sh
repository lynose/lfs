#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/autoconf-2.70
 then
  rm -rf /sources/autoconf-2.70
fi

tar xf /sources/autoconf-2.70.tar.xz -C /sources/ &&

cd /sources/autoconf-2.70 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
    make check &&
    ${log} `basename "$0"` " unexpected check succeed" basic
    ${log} `basename "$0"` " expected check fail?" basic
fi
make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic
