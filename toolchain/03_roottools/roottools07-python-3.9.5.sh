#!/bin/bash
${log} `basename "$0"` " started" roottools &&
WORK=`pwd` &&

if test -d /sources/Python-3.9.5
 then
  rm -rf /sources/Python-3.9.5
fi
tar -xJf /sources/Python-3.9.5.tar.xz -C /sources/ &&
cd /sources/Python-3.9.5 &&


./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&

cd $WORK &&
rm -rf /sources/Python-3.9.5 &&
${log} `basename "$0"` " finished" roottools
