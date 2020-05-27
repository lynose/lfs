#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/libcap-2.34
 then
  rm -rf /sources/libcap-2.34
fi

tar -xJf /sources/libcap-2.34.tar.xz -C /sources &&

cd /sources/libcap-2.34 &&

sed -i '/install.*STACAPLIBNAME/d' libcap/Makefile &&
${log} `basename "$0"` " configured" target &&

make lib=lib &&
${log} `basename "$0"` " built" target &&

make test &&
${log} `basename "$0"` " tested" target &&

make lib=lib PKGCONFIGDIR=/usr/lib/pkgconfig install &&
chmod -v 755 /lib/libcap.so.2.34 &&
mv -v /lib/libpsx.a /usr/lib &&
rm -v /lib/libcap.so &&
ln -sfv ../../lib/libcap.so.2 /usr/lib/libcap.so &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
