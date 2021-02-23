#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/libcap-2.48
 then
  rm -rf /sources/libcap-2.48
fi

tar xf /sources/libcap-2.48.tar.xz -C /sources &&

cd /sources/libcap-2.48 &&

sed -i '/install -m.*STA/d' libcap/Makefile &&
${log} `basename "$0"` " configured" basic &&

make prefix=/usr lib=lib &&
${log} `basename "$0"` " built" basic &&


make test &&
${log} `basename "$0"` " tested" basic

    
make prefix=/usr lib=lib install
for libname in cap psx; do
    mv -v /usr/lib/lib${libname}.so.* /lib
    ln -sfv ../../lib/lib${libname}.so.2 /usr/lib/lib${libname}.so
    chmod -v 755 /lib/lib${libname}.so.2.48
done
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
