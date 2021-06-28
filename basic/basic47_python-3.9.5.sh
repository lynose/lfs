#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/Python-3.9.5
 then
  rm -rf /sources/Python-3.9.5
fi

tar xf /sources/Python-3.9.5.tar.xz -C /sources/ &&

cd /sources/Python-3.9.5 &&

./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --with-system-ffi    \
            --with-ensurepip=yes \
            --enable-optimizations &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&

install -v -dm755 /usr/share/doc/python-3.9.5/html &&
tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.9.5/html \
    -xvf ../python-3.9.5-docs-html.tar.bz2 &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/Python-3.9.5 &&
${log} `basename "$0"` " finished" basic 
