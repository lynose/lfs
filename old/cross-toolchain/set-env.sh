#!/bin/bash
if test -d /lfs
 then
  mkdir /lfs &&
  mount /dev/sda6 /lfs
fi
if test -d /lfs-boot
 then
  mkdir /lfs-boot &&
  mount /dev/sda1 /lfs-boot
fi
if test -d /windows
 then
  mkdir /windows &&
  mount /dev/sda2 /windows
fi
if test -d /lfs
 then
  mkdir /data
  if test -e /dev/sdc1
   then
    mount /dev/sdc1 /data
  fi
fi
