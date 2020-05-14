#!/bin/bash
if test -d /sources/util-linux-2.21.2
 then
  rm -rf /sources/util-linux-2.21.2
fi
tar -xJf /sources/util-linux-2.21.2.tar.xz -C /sources/ &&
cd /sources/util-linux-2.21.2 &&
sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
    $(grep -rl '/etc/adjtime' .) &&
mkdir -pv /var/lib/hwclock &&
./configure  &&
make &&
make install