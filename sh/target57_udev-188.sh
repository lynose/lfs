#!/bin/bash
if test -d /sources/systemd-188
 then
  rm -rf /sources/systemd-188
fi
tar -xJf /sources/systemd-188.tar.xz -C /sources/ &&
cd /sources/systemd-188 &&
tar -xvf ../udev-lfs-188-3.tar.bz2 &&
make -f udev-lfs-188/Makefile.lfs &&
make -f udev-lfs-188/Makefile.lfs install &&
bash udev-lfs-188/init-net-rules.sh
