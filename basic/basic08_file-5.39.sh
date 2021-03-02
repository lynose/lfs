#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/file-5.39
 then
  rm -rf /sources/file-5.39
fi
tar -xzf /sources/file-5.39.tar.gz -C /sources/ &&
cd /sources/file-5.39 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/file-5.39 &&
${log} `basename "$0"` " finished" basic 

