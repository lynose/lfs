#!/bin/bash

mount -v --bind /dev $LFS/dev &&

mount -v --bind /dev/pts $LFS/dev/pts &&
mount -vt proc proc $LFS/proc &&
mount -vt sysfs sysfs $LFS/sys &&
mount -vt tmpfs tmpfs $LFS/run &&

chroot "$LFS" /usr/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    MAKEFLAGS='-j 16' \
    log=/sh/log/logger.sh \
    /bin/bash --login +h
