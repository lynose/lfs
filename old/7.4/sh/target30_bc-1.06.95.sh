#!/bin/bash
if test -d /sources/bc-1.06.95
 then
  rm -rf /sources/bc-1.06.95
fi
tar -xjf /sources/bc-1.06.95.tar.bz2 -C /sources/ &&
cd /sources/bc-1.06.95 &&

./configure --prefix=/usr --with-readline &&

make &&

echo "quit" | ./bc/bc -l Test/checklib.b &&

make install
