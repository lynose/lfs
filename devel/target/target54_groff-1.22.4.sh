#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/groff-1.22.4
 then
  rm -rf /sources/groff-1.22.4
fi

tar -xzf /sources/groff-1.22.4.tar.gz -C /sources/ &&
cd /sources/groff-1.22.4 &&

PAGE=A4 ./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make -j1 &&
${log} `basename "$0"` " built" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
