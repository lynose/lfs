#!/bin/bash
if test -d /sources/kmod-14
 then
  rm -rf /sources/kmod-14
fi

tar -xJf /sources/kmod-14.tar.xz -C /sources/ &&

cd /sources/kmod-14 &&

./configure --prefix=/usr       \
            --bindir=/bin       \
            --libdir=/lib       \
            --sysconfdir=/etc   \
            --disable-manpages  \
            --with-xz           \
            --with-zlib &&
make &&

make check &&

make pkgconfigdir=/usr/lib/pkgconfig install &&

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sv ../bin/kmod /sbin/$target
done

ln -sv kmod /bin/lsmod