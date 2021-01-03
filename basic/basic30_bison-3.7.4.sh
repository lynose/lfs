#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bison-3.7.4
 then
  rm -rf /sources/bison-3.7.4
fi
tar -xJf /sources/bison-3.7.4.tar.xz -C /sources/ &&

cd /sources/bison-3.7.4 &&

./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.7.4 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&
if [ ${ENABLE_TEST} == true ]
 then
    make check &&   # Multi Thread fails in first run, possible race condition
    ${log} `basename "$0"` " checked" basic
    ${log} `basename "$0"` " unknown result documented" basic
    #make check          # Would work in the second run
fi
make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
