#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/grub-2.04
 then
  rm -rf /sources/grub-2.04
fi
tar xf /sources/grub-2.04.tar.xz -C /sources/ &&
cd /sources/grub-2.04 &&

./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
