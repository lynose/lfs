#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/dejagnu-1.6.2
 then
  rm -rf /sources/dejagnu-1.6.2
fi
tar xf /sources/dejagnu-1.6.2.tar.gz -C /sources/ &&
cd /sources/dejagnu-1.6.2 &&

./configure --prefix=/usr &&
makeinfo --html --no-split -o doc/dejagnu.html doc/dejagnu.texi &&
makeinfo --plaintext       -o doc/dejagnu.txt  doc/dejagnu.texi &&
${log} `basename "$0"` " configured" basic &&

make install &&
install -v -dm755  /usr/share/doc/dejagnu-1.6.2 &&
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.2 &&
${log} `basename "$0"` " installed" basic &&
if [ ${ENABLE_TEST} == true ]
 then
  make check &&
  ${log} `basename "$0"` " check succeed" blfs_all ||
  ${log} `basename "$0"` " expected check fail?" blfs_all
fi

${log} `basename "$0"` " finished" basic
