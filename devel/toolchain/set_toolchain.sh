#! /bin/bash
export LFS=/lfs
echo $LFS

if test -d $LFS/tools
 then 
  rm -rf $LFS/tools
  rm -vf /tools
fi

if test -d $LFS/sh
 then
  rm -rf $LFS/sh
fi

if [ ! -f /sources ]
  then
    mkdir -v $LFS/tools
fi
#cp -R ../sources $LFS

cp -R ../sh $LFS

if [ ! -f /sources ]
  then
    ln -sv $LFS/tools /
fi

if [ ! -f /sources ]
 then
    ln -sv $LFS/sources /
fi

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
chown -v lfs $LFS/sh
su - lfs
