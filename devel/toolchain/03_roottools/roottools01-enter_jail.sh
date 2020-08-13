#!/bin/bash
echo $LFS
chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools} &&
case $(uname -m) in
  x86_64) chown -R root:root $LFS/lib64 ;;
esac

mkdir -pv $LFS/{dev,proc,sys,run} &&

mknod -m 600 $LFS/dev/console c 5 1 &&
mknod -m 666 $LFS/dev/null c 1 3 &&

mount -v --bind /dev $LFS/dev &&

mount -v --bind /dev/pts $LFS/dev/pts &&
mount -vt proc proc $LFS/proc &&
mount -vt sysfs sysfs $LFS/sys &&
mount -vt tmpfs tmpfs $LFS/run &&

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

chroot "$LFS" /usr/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    MAKEFLAGS='-j 1' \
    log=/sh/log/logger.sh \
    /bin/bash --login +h
