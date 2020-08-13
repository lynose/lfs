#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/libcap-2.42
 then
  rm -rf /sources/libcap-2.42
fi

tar xf /sources/libcap-2.42.tar.xz -C /sources &&

cd /sources/libcap-2.42 &&

sed -i '/install -m.*STACAPLIBNAME/d' libcap/Makefile &&
${log} `basename "$0"` " configured" basic &&

make lib=lib &&
${log} `basename "$0"` " built" basic &&

make test &&
${log} `basename "$0"` " tested" basic &&

make lib=lib PKGCONFIGDIR=/usr/lib/pkgconfig install &&
chmod -v 755 /lib/libcap.so.2.36 &&
mv -v /lib/libpsx.a /usr/lib &&
rm -v /lib/libcap.so &&
ln -sfv ../../lib/libcap.so.2 /usr/lib/libcap.so &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
