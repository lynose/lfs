#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/automake-1.16.3
 then
  rm -rf /sources/automake-1.16.3
fi
tar xf /sources/automake-1.16.3.tar.xz -C /sources/ &&
cd /sources/automake-1.16.3 &&

sed -i "s/''/etags/" t/tags-lisp-space.sh &&

./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.3 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&
if [ ${ENABLE_TEST} == true ]
 then
  make -j4 check &&
  ${log} `basename "$0"` " unexpected test succeed" basic
  ${log} `basename "$0"` " expected test fail?" basic
fi
make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
