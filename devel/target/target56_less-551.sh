#!/bin/bash
if test -d /sources/less-551
 then
  rm -rf /sources/less-551
fi
tar -xzf /sources/less-551.tar.gz -C /sources/ &&
cd /sources/less-551 &&
./configure --prefix=/usr --sysconfdir=/etc &&
make &&
make install
