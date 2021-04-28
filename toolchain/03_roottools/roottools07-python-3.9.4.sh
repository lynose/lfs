#!/bin/bash
${log} `basename "$0"` " started" roottools &&
WORK=`pwd` &&

if test -d /sources/Python-3.9.4
 then
  rm -rf /sources/Python-3.9.4
fi
tar -xJf /sources/Python-3.9.4.tar.xz -C /sources/ &&
cd /sources/Python-3.9.4 &&


./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&

cd $WORK &&
rm -rf /sources/Python-3.9.4 &&
${log} `basename "$0"` " finished" roottools
