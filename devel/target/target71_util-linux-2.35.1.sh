#!/bin/bash
if test -d /sources/util-linux-2.35.1
 then
  rm -rf /sources/util-linux-2.35.1
fi

tar -xJf /sources/util-linux-2.35.1.tar.xz -C /sources/ &&

cd /sources/util-linux-2.35.1 &&

mkdir -pv /var/lib/hwclock &&

rm -vf /usr/include/{blkid,libfdisk,libmount,uuid} &&
rm -vf /usr/lib/lib{blkid,fdisk,mount,uuid}.so* &&
rm -vf /usr/lib/pkgconfig/{blkid,fdisk,mount,uuid}.pc &&

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.35.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python  &&

make &&
#chown -Rv nobody .
#su nobody -s /bin/bash -c "PATH=$PATH make check"

make install
