#! /bin/bash
export LFS=/lfs
echo $LFS

if test -d $LFS/tools
 then 
  rm -rf $LFS/tools
fi

if [ ! -d $LFS/tools ]
  then
    mkdir -v $LFS/tools
fi

if [ ! -d $%LFS/sources ]
  then
    mkdir -v $LFS/sources
fi

if [ ! -h /tools ]
  then
    ln -sv $LFS/tools /
fi

if [ ! -h /sources ]
 then
    ln -sv $LFS/sources /
fi

cp -R ../sources $LFS
cp -R ../toolchain $LFS/sh
cp -R ../target $LFS/sh

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
chown -vR lfs $LFS/sh
su - lfs
