#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/util-linux-2.37
 then
  rm -rf /sources/util-linux-2.37
fi

tar xf /sources/util-linux-2.37.tar.xz -C /sources/ &&

cd /sources/util-linux-2.37 &&

mkdir -pv /var/lib/hwclock &&

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --libdir=/usr/lib    \
            --docdir=/usr/share/doc/util-linux-2.37 \
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
tar -xf /sources/util-linux-man-pages-2.37.tar.xz --directory /usr/share/man --strip-components=1
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/util-linux-2.37 &&
${log} `basename "$0"` " finished" basic 
