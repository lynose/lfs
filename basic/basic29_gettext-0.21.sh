#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gettext-0.21
 then
  echo "Found and remove"
  rm -rf /sources/gettext-0.21
fi
sleep 3
tar -xJf /sources/gettext-0.21.tar.xz -C /sources/ &&

cd /sources/gettext-0.21 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
chmod -v 0755 /usr/lib/preloadable_libintl.so &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
