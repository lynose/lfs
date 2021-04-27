#!/bin/bash
${log} `basename "$0"` " started" basic &&
WORK=`pwd` &&
if test -d /sources/Python-3.9.2
 then
  rm -rf /sources/Python-3.9.2
fi

tar -xJf /sources/Python-3.9.2.tar.xz -C /sources/ &&

cd /sources/Python-3.9.2 &&

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&


make test &&
${log} `basename "$0"` " check succeed" basic ||
${log} `basename "$0"` " !!! check failed? !!!" basic


make install &&

install -v -dm755 /usr/share/doc/python-3.9.2/html &&
tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.9.2/html \
    -xvf ../python-3.9.2-docs-html.tar.bz2 &&
${log} `basename "$0"` " installed" basic &&

cd $WORK &&
rm -rf /sources/Python-3.9.2 &&
${log} `basename "$0"` " finished" basic 
