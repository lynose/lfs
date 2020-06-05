#!/bin/bash
echo $LFS

chown -R root:root $LFS/tools &&

mkdir -pv $LFS/{dev,proc,sys,run} &&

mknod -m 600 $LFS/dev/console c 5 1 &&
mknod -m 666 $LFS/dev/null c 1 3 &&

mount -v --bind /dev $LFS/dev &&

mount -vt devpts devpts $LFS/dev/pts &&
mount -vt proc proc $LFS/proc &&
mount -vt sysfs sysfs $LFS/sys &&
mount -vt tmpfs tmpfs $LFS/run &&

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    MAKEFLAGS='-j 1' \
    log=/sh/log/logger.sh \
    /tools/bin/bash --login +h
