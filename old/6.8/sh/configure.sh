#!/bin/bash
export LFS=/lfs

if test -d $LFS/sources
then
 echo "Source folder $LFS/sources already created"
else
 
 echo "Creating source folder -->$LFS/sources"
 mkdir -v $LFS/sources
fi


if test -d $LFS/tools
then
 echo "Source folder $LFS/tools already created"
else
 
 echo "Creating source folder -->$LFS/tools"
 mkdir -v $LFS/tools
fi
chmod -v a+wt $LFS/sources

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/tools
 
chown -v lfs $LFS/sources

su - lfs