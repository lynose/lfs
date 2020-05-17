#!/bin/bash
if test -d /sources/attr-2.4.48
 then
  rm -rf /sources/attr-2.4.48
fi

tar -xzf /sources/attr-2.4.48.tar.gz -C /sources &&

cd /sources/attr-2.4.48 &&

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48 &&
make &&

make check &&

make install &&

mv -v /usr/lib/libattr.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so