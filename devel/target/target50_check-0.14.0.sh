#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/check-0.14.0
 then
  rm -rf /sources/check-0.14.0
fi

tar -xzf /sources/check-0.14.0.tar.gz -C /sources/ &&
cd /sources/check-0.14.0 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make docdir=/usr/share/doc/check-0.14.0 install &&
sed -i '1 s/tools/usr/' /usr/bin/checkmk &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
