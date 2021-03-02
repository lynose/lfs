#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/psmisc-23.4
 then
  rm -rf /sources/psmisc-23.4
fi
tar -xJf /sources/psmisc-23.4.tar.xz -C /sources/ &&
cd /sources/psmisc-23.4 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
mv -v /usr/bin/fuser   /bin &&
mv -v /usr/bin/killall /bin &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/psmisc-23.4 &&
${log} `basename "$0"` " finished" basic 
