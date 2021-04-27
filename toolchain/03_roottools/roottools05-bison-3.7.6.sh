#!/bin/bash
${log} `basename "$0"` " started" roottools &&
WORK=`pwd`
if test -d /sources/bison-3.7.6
 then
  rm -rf /sources/bison-3.7.6
fi

tar -xJf /sources/bison-3.7.6.tar.xz -C /sources/ &&

cd /sources/bison-3.7.6 &&

./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.7.6 &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&

cd $WORK &&
rm -rf /sources/bison-3.7.6 &&
${log} `basename "$0"` " finished" roottools
