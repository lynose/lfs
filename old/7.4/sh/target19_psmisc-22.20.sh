#!/bin/bash
if test -d /sources/psmisc-22.20
 then
  rm -rf /sources/psmisc-22.20
fi
tar -xzf /sources/psmisc-22.20.tar.gz -C /sources/ &&
cd /sources/psmisc-22.20 &&

./configure --prefix=/usr &&

make &&

make install &&

mv -v /usr/bin/fuser   /bin &&
mv -v /usr/bin/killall /bin