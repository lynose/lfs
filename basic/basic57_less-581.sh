#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/less-581
 then
  rm -rf /sources/less-581
fi
tar xf /sources/less-581.tar.gz -C /sources/ &&
cd /sources/less-581 &&

./configure --prefix=/usr --sysconfdir=/etc &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/less-581 &&
${log} `basename "$0"` " finished" basic
