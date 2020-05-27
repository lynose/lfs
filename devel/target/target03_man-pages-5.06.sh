#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/man-pages-5.06
 then
  rm -rf /sources/man-pages-5.06
fi
tar -xJf /sources/man-pages-5.06.tar.xz -C /sources/ &&
cd /sources/man-pages-5.06 &&
make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

