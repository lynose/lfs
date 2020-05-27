#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/libffi-3.3
 then
  rm -rf /sources/libffi-3.3
fi

tar -xzf /sources/libffi-3.3.tar.gz -C /sources/ &&

cd /sources/libffi-3.3 &&

./configure --prefix=/usr --disable-static --with-gcc-arch=native &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check failed?" target

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
