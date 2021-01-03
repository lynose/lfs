#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/Python-3.9.1
 then
  rm -rf /sources/Python-3.9.1
fi

tar -xJf /sources/Python-3.9.1.tar.xz -C /sources/ &&

cd /sources/Python-3.9.1 &&

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
    make test &&
    ${log} `basename "$0"` " unexpected check succeed" basic
    ${log} `basename "$0"` " expected check failed?" basic
fi

make install &&
chmod -v 755 /usr/lib/libpython3.9.so &&
chmod -v 755 /usr/lib/libpython3.so &&
ln -sfv pip3.9 /usr/bin/pip3 &&

install -v -dm755 /usr/share/doc/python-3.9.1/html &&
tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.9.1/html \
    -xvf ../python-3.9.1-docs-html.tar.bz2 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
