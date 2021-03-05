#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if [ -d $LFS/sources/coreutils-8.32 ]
 then
  rm -rf $LFS/sources/coreutils-8.32
fi
tar xf $LFS/sources/coreutils-8.32.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/coreutils-8.32 &&

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
mv -v $LFS/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} $LFS/bin &&
mv -v $LFS/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        $LFS/bin &&
mv -v $LFS/usr/bin/{rmdir,stty,sync,true,uname}               $LFS/bin &&
mv -v $LFS/usr/bin/{head,nice,sleep,touch}                    $LFS/bin &&
mv -v $LFS/usr/bin/chroot                                     $LFS/usr/sbin &&
mkdir -pv $LFS/usr/share/man/man8 &&
mv -v $LFS/usr/share/man/man1/chroot.1                        $LFS/usr/share/man/man8/chroot.8 &&
sed -i 's/"1"/"8"/'                                           $LFS/usr/share/man/man8/chroot.8 &&

${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/coreutils-8.32 &&
${log} `basename "$0"` " finished" crosstemp
