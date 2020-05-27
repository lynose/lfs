#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/inetutils-1.9.4
 then
  rm -rf /sources/inetutils-1.9.4
fi
tar -xJf /sources/inetutils-1.9.4.tar.xz -C /sources/ &&
cd /sources/inetutils-1.9.4 &&

./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` " checked" target &&

make install &&
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin &&
mv -v /usr/bin/ifconfig /sbin &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
