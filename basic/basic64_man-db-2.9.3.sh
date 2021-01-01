#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/man-db-2.9.3
 then
  rm -rf /sources/man-db-2.9.3
fi

tar -xJf /sources/man-db-2.9.3.tar.xz -C /sources/ &&

cd /sources/man-db-2.9.3 &&

sed -i '/find/s@/usr@@' init/systemd/man-db.service.in &&
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.9.3 \
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
${log} `basename "$0"` "unexpected check succeed" basic
${log} `basename "$0"` "expected check fail?" basic

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
