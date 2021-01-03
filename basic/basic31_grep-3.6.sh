#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/grep-3.6
 then
  rm -rf /sources/grep-3.6
fi
tar -xJf /sources/grep-3.6.tar.xz -C /sources/ &&
cd /sources/grep-3.6 &&

./configure --prefix=/usr --bindir=/bin &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
    make check &&
    ${log} `basename "$0"` " checked" basic &&
fi

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
