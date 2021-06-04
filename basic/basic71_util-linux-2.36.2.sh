#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/util-linux-2.36.2
 then
  rm -rf /sources/util-linux-2.36.2
fi

tar xf /sources/util-linux-2.36.2.tar.xz -C /sources/ &&

cd /sources/util-linux-2.36.2 &&

mkdir -pv /var/lib/hwclock &&

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
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
            runstatedir=/run  &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

chown -Rv tester . &&
su tester -c "make -k check" &&
${log} `basename "$0"` " check succeed" basic ||
${log} `basename "$0"` " !!!check failed!!!" basic


make install &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/util-linux-2.36.2 &&
${log} `basename "$0"` " finished" basic 
