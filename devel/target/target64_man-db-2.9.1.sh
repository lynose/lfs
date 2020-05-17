#!/bin/bash
if test -d /sources/man-db-2.9.1
 then
  rm -rf /sources/man-db-2.9.1
fi

tar -xJf /sources/man-db-2.9.1.tar.xz -C /sources/ &&

cd /sources/man-db-2.9.1 &&

sed -i '/find/s@/usr@@' init/systemd/man-db.service.in &&

./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.9.1 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap &&
            
make &&

make check

make install
