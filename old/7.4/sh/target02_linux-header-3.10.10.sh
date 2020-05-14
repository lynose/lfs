#!/bin/bash
if test -d /sources/linux-3.10.10
 then
  rm -rf /sources/linux-3.10.10
fi
tar -xJf /sources/linux-3.10.10.tar.xz -C /sources/ &&
cd /sources/linux-3.10.10 &&

make mrproper &&

make headers_check
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include