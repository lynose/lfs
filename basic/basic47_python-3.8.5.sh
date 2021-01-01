#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/Python-3.8.5
 then
  rm -rf /sources/Python-3.8.5
fi

tar -xJf /sources/Python-3.8.5.tar.xz -C /sources/ &&

cd /sources/Python-3.8.5 &&

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
chmod -v 755 /usr/lib/libpython3.8.so &&
chmod -v 755 /usr/lib/libpython3.so &&
ln -sfv pip3.8 /usr/bin/pip3 &&
install -v -dm755 /usr/share/doc/python-3.8.5/html &&
tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.8.5/html \
    -xvf ../python-3.8.5-docs-html.tar.bz2 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
