#!/bin/bash
if test -d /sources/systemd-206
 then
  rm -rf /sources/systemd-206
fi

tar -xJf /sources/systemd-206.tar.xz -C /sources/ &&

cd /sources/systemd-206 &&

tar -xvf ../udev-lfs-206-1.tar.bz2 &&

make -f udev-lfs-206-1/Makefile.lfs &&

make -f udev-lfs-206-1/Makefile.lfs install &&

build/udevadm hwdb --update &&

bash udev-lfs-206-1/init-net-rules.sh