#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/psmisc-23.3
 then
  rm -rf /sources/psmisc-23.3
fi
tar -xJf /sources/psmisc-23.3.tar.xz -C /sources/ &&
cd /sources/psmisc-23.3 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make install &&
mv -v /usr/bin/fuser   /bin &&
mv -v /usr/bin/killall /bin &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
