#!/bin/bash
export LFS=/lfs
echo $LFS

if test -d $LFS/sources
then
 echo "Removing old sources folder $LFS/sources already"
 rm -rf $LFS/sources
 echo "Creating source folder -->$LFS/sources"
 mkdir -v $LFS/sources
else 
 echo "Creating source folder -->$LFS/sources"
 mkdir -v $LFS/sources
fi

if test -d $LFS/tools
then
 echo "Removing old source folder $LFS/tools"
 rm -rf $LFS/tools
 echo "Creating source folder -->$LFS/tools"
 mkdir -v $LFS/tools
else
  echo "Creating source folder -->$LFS/tools"
 mkdir -v $LFS/tools
fi

chmod -v a+wt $LFS/sources
chmod -v a+wt $LFS/tools

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
passwd lfs

chown -v lfs $LFS/tools
chgrp -v lfs $LFS/tools
 
chown -v lfs $LFS/sources
chgrp -v lfs $LFS/sources

su - lfs