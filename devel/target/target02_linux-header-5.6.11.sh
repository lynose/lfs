#!/bin/bash
if test -d /sources/linux-5.6.11
 then
  rm -rf /sources/linux-5.6.11
fi
tar -xJf /sources/linux-5.6.11.tar.xz -C /sources/ &&
cd /sources/linux-5.6.11 &&

make mrproper &&

make headers &&
find usr/include -name '.*' -delete &&
rm usr/include/Makefile &&
cp -rv usr/include/* /usr/include
