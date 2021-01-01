#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/psmisc-23.3
 then
  rm -rf /sources/psmisc-23.3
fi
tar -xJf /sources/psmisc-23.3.tar.xz -C /sources/ &&
cd /sources/psmisc-23.3 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
mv -v /usr/bin/fuser   /bin &&
mv -v /usr/bin/killall /bin &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
