#!/bin/bash
if test -d /sources/grub-2.04
 then
  rm -rf /sources/grub-2.04
fi
tar -xJf /sources/grub-2.04.tar.xz -C /sources/ &&
cd /sources/grub-2.04 &&

./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror &&
make &&
make install &&
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
