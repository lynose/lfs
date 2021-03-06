#!/bin/bash
${log} `basename "$0"` " started" roottools &&

if test -d /sources/Python-3.9.2
 then
  rm -rf /sources/Python-3.9.2
fi
tar -xJf /sources/Python-3.9.2.tar.xz -C /sources/ &&
cd /sources/Python-3.9.2 &&


./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&

rm -rf /sources/Python-3.9.2 &&
${log} `basename "$0"` " finished" roottools
