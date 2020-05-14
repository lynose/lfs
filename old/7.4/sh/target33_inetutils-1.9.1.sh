#!/bin/bash
if test -d /sources/inetutils-1.9.1
 then
  rm -rf /sources/inetutils-1.9.1
fi
tar -xzf /sources/inetutils-1.9.1.tar.gz -C /sources/ &&
cd /sources/inetutils-1.9.1 &&
sed -i -e '/gets is a/d' lib/stdio.in.h &&
./configure --prefix=/usr  \
    --libexecdir=/usr/sbin \
    --localstatedir=/var   \
    --disable-ifconfig     \
    --disable-logger       \
    --disable-syslogd      \
    --disable-whois        \
    --disable-servers &&
make &&
make check &&
make install &&
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin