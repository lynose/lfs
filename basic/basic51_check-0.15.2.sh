#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/check-0.15.2
 then
  rm -rf /sources/check-0.15.2
fi

tar -xzf /sources/check-0.15.2.tar.gz -C /sources/ &&
cd /sources/check-0.15.2 &&

./configure --prefix=/usr --disable-static &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make docdir=/usr/share/doc/check-0.15.2 install &&
sed -i '1 s/tools/usr/' /usr/bin/checkmk &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/check-0.15.2 &&
${log} `basename "$0"` " finished" basic 
