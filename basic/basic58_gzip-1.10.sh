#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gzip-1.10
 then
  rm -rf /sources/gzip-1.10
fi

tar -xJf /sources/gzip-1.10.tar.xz -C /sources/ &&

cd /sources/gzip-1.10 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " check succeed" basic ||
${log} `basename "$0"` " !!!check fail!!!" basic

make install &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/gzip-1.10 &&
${log} `basename "$0"` " finished" basic 

