#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/attr-2.4.48
 then
  rm -rf /sources/attr-2.4.48
fi

tar xf /sources/attr-2.4.48.tar.gz -C /sources &&

cd /sources/attr-2.4.48 &&

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
mv -v /usr/lib/libattr.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/attr-2.4.48 &&
${log} `basename "$0"` " finished" basic 
