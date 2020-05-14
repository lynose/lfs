#!/bin/bash
if test -d /sources/bash-4.2
 then
  rm -rf /sources/bash-4.2
fi
tar -xjf /sources/bash-4.2.tar.bz2 -C /sources/ &&
cd /sources/bash-4.2 &&
patch -Np1 -i ../bash-4.2-fixes-8.patch &&
./configure --prefix=/usr                     \
            --bindir=/bin                     \
            --htmldir=/usr/share/doc/bash-4.2 \
            --without-bash-malloc             \
            --with-installed-readline &&
make &&
chown -Rv nobody . &&
su nobody -s /bin/bash -c "PATH=$PATH make tests" &&
make install &&
exec /bin/bash --login +h