#!/bin/bash
if test -d /sources/grub-2.00
 then
  rm -rf /sources/grub-2.00
fi
tar -xJf /sources/grub-2.00.tar.xz -C /sources/ &&
cd /sources/grub-2.00 &&
sed -i -e '/gets is a/d' grub-core/gnulib/stdio.in.h &&
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-grub-emu-usb \
            --disable-efiemu       \
            --disable-werror &&
make &&
make install