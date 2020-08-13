#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/procps-ng-3.3.16
 then
  rm -rf /sources/procps-ng-3.3.16
fi

tar xf /sources/procps-ng-3.3.16.tar.xz -C /sources/ &&

cd /sources/procps-ng-3.3.16 &&

./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.16 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` "unexpected check succeed" basic
${log} `basename "$0"` "expected check fail?" basic

make install &&
mv -v /usr/lib/libprocps.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 

