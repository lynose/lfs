#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/less-551
 then
  rm -rf /sources/less-551
fi
tar -xzf /sources/less-551.tar.gz -C /sources/ &&
cd /sources/less-551 &&

./configure --prefix=/usr --sysconfdir=/etc &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target
