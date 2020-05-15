#!/bin/bash
if test -d $LFS/sources/linux-5.6.11
 then
  rm -rf $LFS/sources/linux-5.6.11
fi
tar -xJf $LFS/sources/linux-5.6.11.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/linux-5.6.11 &&

make mrproper &&

make headers &&
cp -rv usr/include/* /tools/include
