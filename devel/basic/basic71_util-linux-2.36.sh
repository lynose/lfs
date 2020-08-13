#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/util-linux-2.36
 then
  rm -rf /sources/util-linux-2.36
fi

tar xf /sources/util-linux-2.36.tar.xz -C /sources/ &&

cd /sources/util-linux-2.36 &&

mkdir -pv /var/lib/hwclock &&

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.36 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python  &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&
chown -Rv tester . &&
su tester -c "make -k check" &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
