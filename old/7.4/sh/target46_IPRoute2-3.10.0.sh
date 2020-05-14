#!/bin/bash
if test -d /sources/iproute2-3.10.0
 then
  rm -rf /sources/iproute2-3.10.0
fi

tar -xJf /sources/iproute2-3.10.0.tar.xz -C /sources/ &&

cd /sources/iproute2-3.10.0 &&

sed -i '/^TARGETS/s@arpd@@g' misc/Makefile &&
sed -i /ARPD/d Makefile &&
sed -i 's/arpd.8//' man/man8/Makefile &&
make DESTDIR= &&
make DESTDIR=              \
     MANDIR=/usr/share/man \
     DOCDIR=/usr/share/doc/iproute2-3.10.0 install
