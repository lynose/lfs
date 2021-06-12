#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iproute2-5.12.0
 then
  rm -rf /sources/iproute2-5.12.0
fi

tar xf /sources/iproute2-5.12.0.tar.xz -C /sources/ &&

cd /sources/iproute2-5.12.0 &&

sed -i /ARPD/d Makefile &&
rm -fv man/man8/arpd.8 &&

sed -i 's/.m_ipt.o//' tc/Makefile &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make SBINDIR=/usr/sbin install &&
mkdir -v              /usr/share/doc/iproute2-5.12.0 &&
cp -v COPYING README* /usr/share/doc/iproute2-5.12.0 &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/iproute2-5.12.0 &&
${log} `basename "$0"` " finished" basic 
