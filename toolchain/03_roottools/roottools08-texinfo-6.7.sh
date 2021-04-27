#!/bin/bash
${log} `basename "$0"` " started" roottools &&
WORK=`pwd` &&
if test -d /sources/texinfo-6.7
 then
  rm -rf /sources/texinfo-6.7
fi
tar -xJf /sources/texinfo-6.7.tar.xz -C /sources/ &&
cd /sources/texinfo-6.7 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&

WORK=`pwd` &&
rm -rf /sources/texinfo-6.7 &&
${log} `basename "$0"` " finished" roottools

