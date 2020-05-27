#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/expat-2.2.9
 then
  rm -rf /sources/expat-2.2.9
fi

tar -xJf /sources/expat-2.2.9.tar.xz -C /sources/ &&

cd /sources/expat-2.2.9 &&

sed -i 's|usr/bin/env |bin/|' run.sh.in &&
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.9 &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.9 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
