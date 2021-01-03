#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/libcap-2.46
 then
  rm -rf /sources/libcap-2.46
fi

tar xf /sources/libcap-2.46.tar.xz -C /sources &&

cd /sources/libcap-2.46 &&

sed -i '/install -m.*STA/d' libcap/Makefile &&
${log} `basename "$0"` " configured" basic &&

make lib=lib &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
    make test &&
    ${log} `basename "$0"` " tested" basic
fi
    
make lib=lib PKGCONFIGDIR=/usr/lib/pkgconfig install &&
for libname in cap psx; do
    chmod -v 755 /lib/lib${libname}.so.2.46
    rm -v /lib/lib${libname}.so
    ln -sfv ../../lib/lib${libname}.so.2 /usr/lib/lib${libname}.so
done
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
