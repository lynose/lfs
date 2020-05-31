#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/util-linux-2.35.2
 then
  rm -rf /sources/util-linux-2.35.2
fi

tar -xJf /sources/util-linux-2.35.2.tar.xz -C /sources/ &&

cd /sources/util-linux-2.35.2 &&

mkdir -pv /var/lib/hwclock &&

rm -vf /usr/include/{blkid,libfdisk,libmount,uuid} &&
rm -vf /usr/lib/lib{blkid,fdisk,mount,uuid}.so* &&
rm -vf /usr/lib/pkgconfig/{blkid,fdisk,mount,uuid}.pc &&

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.35.2 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python  &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&
#chown -Rv nobody .
#su nobody -s /bin/bash -c "PATH=$PATH make check"

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
