#!/bin/bash
${log} `basename "$0"` " started" target &&
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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` "unexpected check succeed" target
${log} `basename "$0"` "expected check fail?" target

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
