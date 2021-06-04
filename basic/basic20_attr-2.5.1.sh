#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/attr-2.5.1
 then
  rm -rf /sources/attr-2.5.1
fi

tar xf /sources/attr-2.5.1.tar.gz -C /sources &&

cd /sources/attr-2.5.1 &&

./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.1 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/attr-2.5.1 &&
${log} `basename "$0"` " finished" basic 
