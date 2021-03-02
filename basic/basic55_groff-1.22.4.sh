#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/groff-1.22.4
 then
  rm -rf /sources/groff-1.22.4
fi

tar xf /sources/groff-1.22.4.tar.gz -C /sources/ &&
cd /sources/groff-1.22.4 &&

PAGE=A4 ./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make -j1 &&
${log} `basename "$0"` " built" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/groff-1.22.4 &&
${log} `basename "$0"` " finished" basic 
