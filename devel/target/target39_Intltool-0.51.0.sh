#!/bin/bash
if test -d /sources/intltool-0.51.0
 then
  rm -rf /sources/intltool-0.51.0
fi

tar -xzf /sources/intltool-0.51.0.tar.gz -C /sources/ &&

cd /sources/intltool-0.51.0 &&

sed -i 's:\\\${:\\\$\\{:' intltool-update.in &&

./configure --prefix=/usr &&
make &&
make check &&
make install &&
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
