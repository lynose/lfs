#!/bin/bash
if test -d /lfs
 then
  echo "lfs exists"
 else
  mkdir /lfs &&
  mount /dev/sda6 /lfs
fi
if test -d /lfs-boot
 then
  echo "lfs-boot exists"
 else
  mkdir /lfs-boot &&
  mount /dev/sda1 /lfs-boot
fi
if test -d /windows
 then
  echo "windows exists"
 else
  mkdir /windows &&
  mount /dev/sda2 /windows
fi
if test -d /data
 then
  echo "data exists"
 else
  mkdir /data
  if test -e /dev/sdc1
   then
    mount /dev/sdc1 /data
  fi
fi
