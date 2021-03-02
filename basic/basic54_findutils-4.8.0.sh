#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/findutils-4.8.0
 then
  rm -rf /sources/findutils-4.8.0
fi

tar xf /sources/findutils-4.8.0.tar.xz -C /sources/ &&

cd /sources/findutils-4.8.0 &&

./configure --prefix=/usr --localstatedir=/var/lib/locate &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

chown -Rv tester . &&
su tester -c "PATH=$PATH make check" &&
${log} `basename "$0"` " unexpected check succeed" basic
${log} `basename "$0"` " expected check failed?" basic

make install &&
mv -v /usr/bin/find /bin &&
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/findutils-4.8.0 &&
${log} `basename "$0"` " finished" basic 
