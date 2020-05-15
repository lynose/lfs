#!/bin/bash

if [ ! -d $LFS/sources ]
 then
  mkdir -v $LFS/sources
  chmod -v a+wt $LFS/sources
fi

wget --input-file=../wget-list --continue --directory-prefix=$LFS/sources

cp ../md5sums $LFS/sources

pushd $LFS/sources
md5sum -c md5sums
popd
