#!/bin/bash
if test -d /sources/kmod-9
 then
  rm -rf /sources/kmod-9
fi
tar -xJf /sources/kmod-9.tar.xz -C /sources/ &&
cd /sources/kmod-9 &&
patch -Np1 -i ../kmod-9-testsuite-1.patch &&
./configure --prefix=/usr       \
            --bindir=/bin       \
            --libdir=/lib       \
            --sysconfdir=/etc   \
            --with-xz           \
            --with-zlib &&
make &&
make check &&
make pkgconfigdir=/usr/lib/pkgconfig install &&

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sv ../bin/kmod /sbin/$target
done

ln -sv kmod /bin/lsmod