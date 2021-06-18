#!/bin/bash
chroot "$LFS" /usr/bin/env -i          \
    HOME=/root TERM="$TERM"            \
    PS1='[Kilix]\u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    MAKEFLAGS='-j2'  \
    /bin/bash --login
