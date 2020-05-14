#!/bin/bash
if test -d /sources/less-444
 then
  rm -rf /sources/less-444
fi
tar -xzf /sources/less-444.tar.gz -C /sources/ &&
cd /sources/less-444 &&
./configure --prefix=/usr --sysconfdir=/etc &&
make &&
make install