#!/bin/bash
${log} `basename "$0"` " started" target &&
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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make install &&
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
