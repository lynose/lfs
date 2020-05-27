#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/file-5.38
 then
  rm -rf /sources/file-5.38
fi
tar -xzf /sources/file-5.38.tar.gz -C /sources/ &&
cd /sources/file-5.38 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

