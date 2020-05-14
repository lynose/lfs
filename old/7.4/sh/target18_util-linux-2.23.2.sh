#!/bin/bash
if test -d /sources/util-linux-2.23.2
 then
  rm -rf /sources/util-linux-2.23.2
fi
tar -xJf /sources/util-linux-2.23.2.tar.xz -C /sources/ &&
cd /sources/util-linux-2.23.2 &&

sed -i -e 's@etc/adjtime@var/lib/hwclock/adjtime@g' \
    $(grep -rl '/etc/adjtime' .) &&

mkdir -pv /var/lib/hwclock &&

./configure --disable-su --disable-sulogin --disable-login  &&

make &&
#chown -Rv nobody .
#su nobody -s /bin/bash -c "PATH=$PATH make check"

make install