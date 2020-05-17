#!/bin/bash
if test -d /sources/kmod-27
 then
  rm -rf /sources/kmod-27
fi

tar -xJf /sources/kmod-27.tar.xz -C /sources/ &&

cd /sources/kmod-27 &&

./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib &&

make &&

make install &&

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done

ln -sfv kmod /bin/lsmod
