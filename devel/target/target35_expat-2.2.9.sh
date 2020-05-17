#!/bin/bash
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
make &&
make check &&
make install &&
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.9
