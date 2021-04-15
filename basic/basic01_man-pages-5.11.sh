#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/man-pages-5.11
 then
  rm -rf /sources/man-pages-5.11
fi
tar xf /sources/man-pages-5.11.tar.xz -C /sources/ &&
cd /sources/man-pages-5.11 &&
make install &&
${log} `basename "$0"` " installed" basic &&

cd ${WORKDIR} &&
rm -rf /sources/man-pages-5.11 &&
${log} `basename "$0"` " finished" basic 

