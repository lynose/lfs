#!/bin/bash
if test -d /sources/findutils-4.4.2
 then
  rm -rf /sources/findutils-4.4.2
fi
tar -xjf /sources/findutils-4.4.2.tar.bz2 -C /sources/ &&
cd /sources/findutils-4.4.2 &&
./configure --prefix=/usr                   \
            --libexecdir=/usr/lib/findutils \
            --localstatedir=/var/lib/locate &&
make &&
make check &&
make install &&
mv -v /usr/bin/find /bin &&
sed -i 's/find:=${BINDIR}/find:=\/bin/' /usr/bin/updatedb