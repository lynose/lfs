#!/bin/bash
if test -d /sources/iproute2-5.6.0
 then
  rm -rf /sources/iproute2-5.6.0
fi

tar -xJf /sources/iproute2-5.6.0.tar.xz -C /sources/ &&

cd /sources/iproute2-5.6.0 &&

sed -i /ARPD/d Makefile &&
rm -fv man/man8/arpd.8 &&
sed -i 's/.m_ipt.o//' tc/Makefile &&

make &&

make DOCDIR=/usr/share/doc/iproute2-5.6.0 install