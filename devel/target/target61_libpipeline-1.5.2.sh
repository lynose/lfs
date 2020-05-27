#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/libpipeline-1.5.2
 then
  rm -rf /sources/libpipeline-1.5.2
fi
tar -xzf /sources/libpipeline-1.5.2.tar.gz -C /sources/ &&

cd /sources/libpipeline-1.5.2 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

