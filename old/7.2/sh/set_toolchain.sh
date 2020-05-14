#! /bin/bash
export LFS=/lfs
echo $LFS

if test -d $LFS/tools
 then 
  rm -rf $LFS/tools
  rm -vf /tools
fi

if test -d $LFS/sources
 then
  rm -rf $LFS/sources
  rm -vf /sources
fi

mkdir -v $LFS/tools
cp -R ../sources $LFS
ln -sv $LFS/tools /
ln -sv $LFS/sources /
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
su - lfs