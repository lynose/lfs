#!/bin/bash
if test -d /sources/procps-3.2.8
 then
  rm -rf /sources/procps-3.2.8
fi
tar -xjf /sources/procps-3.2.8.tar.bz2 -C /sources/ &&
cd /sources/procps-3.2.8 &&
patch -Np1 -i ../procps-3.2.8-fix_HZ_errors-1.patch &&
patch -Np1 -i ../procps-3.2.8-watch_unicode-1.patch &&
sed -i -e 's@\*/module.mk@proc/module.mk ps/module.mk@' Makefile &&
make &&
make install