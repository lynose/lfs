#!/bin/bash
${log} `basename "$0"` " started" roottools &&

if test -d /sources/util-linux-2.36.2
 then
  rm -rf /sources/util-linux-2.36.2
fi
tar -xJf /sources/util-linux-2.36.2.tar.xz -C /sources/ &&
cd /sources/util-linux-2.36.2 &&

mkdir -pv /var/lib/hwclock &&

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --docdir=/usr/share/doc/util-linux-2.36.2 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --runstatedir=/run   &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&
${log} `basename "$0"` " finished" roottools
