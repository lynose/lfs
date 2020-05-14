#!/bin/bash
if test -d /sources/less-458
 then
  rm -rf /sources/less-458
fi
tar -xzf /sources/less-458.tar.gz -C /sources/ &&
cd /sources/less-458 &&
./configure --prefix=/usr --sysconfdir=/etc &&
make &&
make install