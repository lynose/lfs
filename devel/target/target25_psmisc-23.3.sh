#!/bin/bash
if test -d /sources/psmisc-23.3
 then
  rm -rf /sources/psmisc-23.3
fi
tar -xJf /sources/psmisc-23.3.tar.xz -C /sources/ &&
cd /sources/psmisc-23.3 &&

./configure --prefix=/usr &&

make &&

make install &&

mv -v /usr/bin/fuser   /bin &&
mv -v /usr/bin/killall /bin
