#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/inetutils-2.0
 then
  rm -rf /sources/inetutils-2.0
fi
tar xf /sources/inetutils-2.0.tar.xz -C /sources/ &&
cd /sources/inetutils-2.0 &&

./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
  make check &&
  ${log} `basename "$0"` " check succeed" blfs_all ||
  ${log} `basename "$0"` " expected check fail?" blfs_all
fi

make install &&
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin &&
mv -v /usr/bin/ifconfig /sbin &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
