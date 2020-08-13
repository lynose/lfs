#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iproute2-5.7.0
 then
  rm -rf /sources/iproute2-5.7.0
fi

tar xf /sources/iproute2-5.7.0.tar.xz -C /sources/ &&

cd /sources/iproute2-5.7.0 &&

sed -i /ARPD/d Makefile &&
rm -fv man/man8/arpd.8 &&
sed -i 's/.m_ipt.o//' tc/Makefile &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make DOCDIR=/usr/share/doc/iproute2-5.7.0 install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
