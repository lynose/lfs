#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/intltool-0.51.0
 then
  rm -rf /sources/intltool-0.51.0
fi

tar xf /sources/intltool-0.51.0.tar.gz -C /sources/ &&

cd /sources/intltool-0.51.0 &&

sed -i 's:\\\${:\\\$\\{:' intltool-update.in &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/intltool-0.51.0 &&
${log} `basename "$0"` " finished" basic 
