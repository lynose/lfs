#!/bin/bash
if test -d /sources/procps-ng-3.3.16
 then
  rm -rf /sources/procps-ng-3.3.16
fi

tar -xJf /sources/procps-ng-3.3.16.tar.xz -C /sources/ &&

cd /sources/procps-ng-3.3.16 &&

./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.16 \
            --disable-static                         \
            --disable-kill                           \
            --with-systemd &&

make &&

sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp &&
sed -i '/set tty/d' testsuite/pkill.test/pkill.exp &&
rm testsuite/pgrep.test/pgrep.exp &&
make check

make install &&

mv -v /usr/lib/libprocps.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

