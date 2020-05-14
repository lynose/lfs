
KERNEL_VERSION=2.6.35.4

export KERNEL_VERSION

echo $KERNEL_VERSION

cd $LFS/sources

if test -d linux-$KERNEL_VERSION
 then
  rm -rf linux-$KERNEL_VERSION
fi
tar xjf linux-$KERNEL_VERSION.tar.bz2

cd linux-$KERNEL_VERSION

make mrproper

make headers_check
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include


