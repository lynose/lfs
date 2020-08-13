#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/libpipeline-1.5.2
 then
  rm -rf /sources/libpipeline-1.5.2
fi
tar xf /sources/libpipeline-1.5.2.tar.gz -C /sources/ &&

cd /sources/libpipeline-1.5.2 &&

patch -Np1 -i ../libpipeline-1.5.2-check_fixes-3.patch &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 

