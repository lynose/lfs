#!/bin/bash
if test -d /sources/coreutils-8.19
 then
  rm -rf /sources/coreutils-8.19
fi
tar -xJf /sources/coreutils-8.19.tar.xz -C /sources/ &&
cd /sources/coreutils-8.19 &&
sed -i -e 's/! isatty/isatty/' \
       -e '45i\              || errno == ENOENT' gnulib-tests/test-getlogin.c &&
patch -Np1 -i ../coreutils-8.19-i18n-1.patch &&
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr         \
            --libexecdir=/usr/lib \
            --enable-no-install-program=kill,uptime &&
make &&
make NON_ROOT_USERNAME=nobody check-root &&
echo "dummy:x:1000:nobody" >> /etc/group &&
chown -Rv nobody . &&
su nobody -s /bin/bash \
          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes -k check || true" &&
sed -i '/dummy/d' /etc/group &&
make install &&
mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin &&
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,pwd,rm} /bin &&
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin &&
mv -v /usr/bin/chroot /usr/sbin &&
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8 &&
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8 &&
mv -v /usr/bin/{head,sleep,nice} /bin &&
mv -v /usr/bin/mv /bin