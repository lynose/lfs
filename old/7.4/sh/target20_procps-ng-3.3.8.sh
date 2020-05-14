#!/bin/bash
if test -d /sources/procps-ng-3.3.8
 then
  rm -rf /sources/procps-ng-3.3.8
fi
tar -xJf /sources/procps-ng-3.3.8.tar.xz -C /sources/ &&
cd /sources/procps-ng-3.3.8 &&

./configure --prefix=/usr                           \
            --exec-prefix=                          \
            --libdir=/usr/lib                       \
            --docdir=/usr/share/doc/procps-ng-3.3.8 \
            --disable-static                        \
            --disable-skill                         \
            --disable-kill &&
make &&

sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp &&

make check &&

make install &&

mv -v /usr/lib/libprocps.so.* /lib &&
ln -sfv ../../lib/libprocps.so.1.1.2 /usr/lib/libprocps.so