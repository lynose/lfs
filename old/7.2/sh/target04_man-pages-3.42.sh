#!/bin/bash
if test -d /sources/man-pages-3.42
 then
  rm -rf /sources/man-pages-3.42
fi
tar -xJf /sources/man-pages-3.42.tar.xz -C /sources/ &&
cd /sources/man-pages-3.42 &&
make install
