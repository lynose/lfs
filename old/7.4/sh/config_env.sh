#!/bin/bash
chown -R root:root $LFS/tools &&
mkdir -v $LFS/{dev,proc,sys} &&
mknod -m 600 $LFS/dev/console c 5 1 &&
mknod -m 666 $LFS/dev/null c 1 3 &&
mount -v --bind /dev $LFS/dev &&
mount -vt devpts devpts $LFS/dev/pts &&
mount -vt proc proc $LFS/proc &&
mount -vt sysfs sysfs $LFS/sys &&

if [ -h $LFS/dev/shm ]; then
  link=$(readlink $LFS/dev/shm)
  mkdir -p $LFS/$link
  mount -vt tmpfs shm $LFS/$link
  unset link
else
  mount -vt tmpfs shm $LFS/dev/shm
fi

chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h