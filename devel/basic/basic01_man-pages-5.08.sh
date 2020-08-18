#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/man-pages-5.08
 then
  rm -rf /sources/man-pages-5.08
fi
tar xf /sources/man-pages-5.08.tar.xz -C /sources/ &&
cd /sources/man-pages-5.08 &&
make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 

