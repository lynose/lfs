#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/findutils-4.7.0
 then
  rm -rf /sources/findutils-4.7.0
fi

tar -xJf /sources/findutils-4.7.0.tar.xz -C /sources/ &&

cd /sources/findutils-4.7.0 &&

./configure --prefix=/usr --localstatedir=/var/lib/locate &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

chown -Rv tester . &&
su tester -c "PATH=$PATH make -j1 check" &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check failed?" target

make install &&
mv -v /usr/bin/find /bin &&
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
