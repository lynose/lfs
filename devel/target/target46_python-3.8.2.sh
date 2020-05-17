#!/bin/bash
if test -d /sources/Python-3.8.2
 then
  rm -rf /sources/Python-3.8.2
fi

tar -xJf /sources/Python-3.8.2.tar.xz -C /sources/ &&

cd /sources/Python-3.8.2 &&

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes &&

make &&

make install &&
chmod -v 755 /usr/lib/libpython3.8.so &&
chmod -v 755 /usr/lib/libpython3.so &&
ln -sfv pip3.8 /usr/bin/pip3 &&

install -v -dm755 /usr/share/doc/python-3.8.2/html &&

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.8.2/html \
    -xvf ../python-3.8.2-docs-html.tar.bz2
