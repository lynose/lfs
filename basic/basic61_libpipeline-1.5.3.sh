#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/libpipeline-1.5.3
 then
  rm -rf /sources/libpipeline-1.5.3
fi
tar xf /sources/libpipeline-1.5.3.tar.gz -C /sources/ &&

cd /sources/libpipeline-1.5.3 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/libpipeline-1.5.3 &&
${log} `basename "$0"` " finished" basic 

