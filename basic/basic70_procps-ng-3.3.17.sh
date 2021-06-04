#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/procps-3.3.17
 then
  rm -rf /sources/procps-3.3.17
fi

tar xf /sources/procps-ng-3.3.17.tar.xz -C /sources/ &&

cd /sources/procps-3.3.17 &&

./configure --prefix=/usr                            \
            --docdir=/usr/share/doc/procps-ng-3.3.17 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` "check succeed" basic ||
${log} `basename "$0"` "expected check fail?" basic

make install &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/procps-3.3.17 &&
${log} `basename "$0"` " finished" basic 

