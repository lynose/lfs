#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/linux-5.6.13
 then
  rm -rf /sources/linux-5.6.13
fi
tar -xJf /sources/linux-5.6.13.tar.xz -C /sources/ &&
cd /sources/linux-5.6.13 &&

make mrproper &&

make headers &&
${log} `basename "$0"` " built" target &&
find usr/include -name '.*' -delete &&
rm usr/include/Makefile &&
cp -rv usr/include/* /usr/include &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

