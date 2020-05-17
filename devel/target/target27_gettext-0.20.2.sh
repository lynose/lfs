#!/bin/bash
if test -d /sources/gettext-0.20.2
 then
  echo "Found and remove"
  rm -rf /sources/gettext-0.20.2
fi
sleep 3
tar -xJf /sources/gettext-0.20.2.tar.xz -C /sources/ &&

cd /sources/gettext-0.20.2 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.20.2 &&

make BISON_LOCALEDIR=/usr/share/locale &&
make check &&
make install &&
chmod -v 0755 /usr/lib/preloadable_libintl.so
