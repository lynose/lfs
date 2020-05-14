#!/bin/bash
if test -d /sources/man-db-2.6.5
 then
  rm -rf /sources/man-db-2.6.5
fi

tar -xJf /sources/man-db-2.6.5.tar.xz -C /sources/ &&

cd /sources/man-db-2.6.5 &&

./configure --prefix=/usr                        \
            --libexecdir=/usr/lib                \
            --docdir=/usr/share/doc/man-db-2.6.5 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap &&
            
make &&

make check &&

make install