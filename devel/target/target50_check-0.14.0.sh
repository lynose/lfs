#!/bin/bash
if test -d /sources/check-0.14.0
 then
  rm -rf /sources/check-0.14.0
fi

tar -xzf /sources/check-0.14.0.tar.gz -C /sources/ &&
cd /sources/check-0.14.0 &&

./configure --prefix=/usr &&

make &&

make check &&

make docdir=/usr/share/doc/check-0.14.0 install &&
sed -i '1 s/tools/usr/' /usr/bin/checkmk
