#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/libffi-3.3
 then
  rm -rf /sources/libffi-3.3
fi

tar -xzf /sources/libffi-3.3.tar.gz -C /sources/ &&

cd /sources/libffi-3.3 &&

./configure --prefix=/usr --disable-static --with-gcc-arch=native &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " check succeed" basic ||
${log} `basename "$0"` " !!!check failed!!!" basic

make install &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/libffi-3.3 &&
${log} `basename "$0"` " finished" basic 
