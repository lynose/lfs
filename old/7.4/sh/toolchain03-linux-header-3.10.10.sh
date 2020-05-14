#!/bin/bash
if test -d $LFS/sources/linux-3.10.10
 then
  rm -rf $LFS/sources/linux-3.10.10
fi
tar -xJf $LFS/sources/linux-3.10.10.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/linux-3.10.10 &&

make mrproper &&

make headers_check &&
make INSTALL_HDR_PATH=dest headers_install &&
cp -rv dest/include/* /tools/include