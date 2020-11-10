#! /bin/bash
export LFS=/lfs
echo $LFS

if [ ! -d $LFS/sources ]
  then
    mkdir -v $LFS/sources
fi

if [ ! -h /sources ]
 then
    ln -sv $LFS/sources /
fi

mkdir $LFS/log

cp -R ../sources/* $LFS/sources
cp -R ../toolchain $LFS/sh
cp -R ../basic $LFS/sh
cp -R ../config $LFS/sh
cp -R ../log $LFS/sh



mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools


groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
chown -vR lfs $LFS/sh
chown -vR lfs $LFS/log


su - lfs
