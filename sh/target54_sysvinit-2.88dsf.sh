#!/bin/bash
if test -d /sources/sysvinit-2.88dsf
 then
  rm -rf /sources/sysvinit-2.88dsf
fi
tar -xjf /sources/sysvinit-2.88dsf.tar.bz2 -C /sources/ &&
cd /sources/sysvinit-2.88dsf &&
sed -i 's@Sending processes@& configured via /etc/inittab@g' src/init.c &&
sed -i -e 's/utmpdump wall/utmpdump/' \
       -e '/= mountpoint/d' \
       -e 's/mountpoint.1 wall.1//' src/Makefile &&
make -C src &&
make -C src install