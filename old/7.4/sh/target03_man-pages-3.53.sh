#!/bin/bash
if test -d /sources/man-pages-3.53
 then
  rm -rf /sources/man-pages-3.53
fi
tar -xJf /sources/man-pages-3.53.tar.xz -C /sources/ &&
cd /sources/man-pages-3.53 &&
make install
