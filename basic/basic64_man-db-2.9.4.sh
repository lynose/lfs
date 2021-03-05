#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/man-db-2.9.4
 then
  rm -rf /sources/man-db-2.9.4
fi

tar -xJf /sources/man-db-2.9.4.tar.xz -C /sources/ &&

cd /sources/man-db-2.9.4 &&

sed -i '/find/s@/usr@@' init/systemd/man-db.service.in &&
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.9.4 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` "check succeed" basic ||
${log} `basename "$0"` "check fail!!!" basic

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/man-db-2.9.4 &&
${log} `basename "$0"` " finished" basic 
