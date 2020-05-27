#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/Python-3.8.3
 then
  rm -rf /sources/Python-3.8.3
fi

tar -xJf /sources/Python-3.8.3.tar.xz -C /sources/ &&

cd /sources/Python-3.8.3 &&

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make install &&
chmod -v 755 /usr/lib/libpython3.8.so &&
chmod -v 755 /usr/lib/libpython3.so &&
ln -sfv pip3.8 /usr/bin/pip3 &&
install -v -dm755 /usr/share/doc/python-3.8.3/html &&
tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.8.3/html \
    -xvf ../python-3.8.3-docs-html.tar.bz2 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
