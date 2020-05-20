#!/bin/bash
if test -d $LFS/sources/linux-5.6.13
 then
  rm -rf $LFS/sources/linux-5.6.13
fi
tar -xJf $LFS/sources/linux-5.6.13.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/linux-5.6.13 &&

make mrproper &&

make headers &&
cp -rv usr/include/* /tools/include
