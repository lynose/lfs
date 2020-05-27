#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/gettext-0.20.2
 then
  echo "Found and remove"
  rm -rf /sources/gettext-0.20.2
fi
sleep 3
tar -xJf /sources/gettext-0.20.2.tar.xz -C /sources/ &&

cd /sources/gettext-0.20.2 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.20.2 &&
${log} `basename "$0"` " configured" target &&

make BISON_LOCALEDIR=/usr/share/locale &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
chmod -v 0755 /usr/lib/preloadable_libintl.so &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
