#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/less-551
 then
  rm -rf /sources/less-551
fi
tar xf /sources/less-551.tar.gz -C /sources/ &&
cd /sources/less-551 &&

./configure --prefix=/usr --sysconfdir=/etc &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic
