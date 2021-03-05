#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/man-pages-5.10
 then
  rm -rf /sources/man-pages-5.10
fi
tar xf /sources/man-pages-5.10.tar.xz -C /sources/ &&
cd /sources/man-pages-5.10 &&
make install &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/man-pages-5.10 &&
${log} `basename "$0"` " finished" basic 

