#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/expat-2.3.0
 then
  rm -rf /sources/expat-2.3.0
fi

tar xf /sources/expat-2.3.0.tar.xz -C /sources/ &&

cd /sources/expat-2.3.0 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.3.0 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&


make check &&
${log} `basename "$0"` " checked" basic

make install &&
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.3.0 &&
${log} `basename "$0"` " installed" basic &&

cd ${WORKDIR} &&
rm -rf /sources/expat-2.3.0 &&
${log} `basename "$0"` " finished" basic 
