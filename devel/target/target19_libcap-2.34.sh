#!/bin/bash
if test -d /sources/libcap-2.34
 then
  rm -rf /sources/libcap-2.34
fi

tar -xJf /sources/libcap-2.34.tar.xz -C /sources &&

cd /sources/libcap-2.34 &&

sed -i '/install.*STACAPLIBNAME/d' libcap/Makefile &&

make lib=lib &&

make test &&

make lib=lib PKGCONFIGDIR=/usr/lib/pkgconfig install &&

chmod -v 755 /lib/libcap.so.2.34 &&
mv -v /lib/libpsx.a /usr/lib &&
rm -v /lib/libcap.so &&
ln -sfv ../../lib/libcap.so.2 /usr/lib/libcap.so
