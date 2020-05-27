#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/coreutils-8.32
 then
  rm -rf /sources/coreutils-8.32
fi
tar -xJf /sources/coreutils-8.32.tar.xz -C /sources/ &&
cd /sources/coreutils-8.32 &&

patch -Np1 -i ../coreutils-8.32-i18n-1.patch &&
sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk &&
autoreconf -fiv &&
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

#make NON_ROOT_USERNAME=nobody check-root &&

#echo "dummy:x:1000:nobody" >> /etc/group &&

#chown -Rv nobody . &&

#su nobody -s /bin/bash \
#          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"

#sed -i '/dummy/d' /etc/group &&

make install &&
mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin &&
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin &&
/bin/mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin &&
/bin/mv -v /usr/bin/chroot /usr/sbin &&
/bin/mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8 &&
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8 &&
/bin/mv -v /usr/bin/{head,nice,sleep,touch} /bin &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
