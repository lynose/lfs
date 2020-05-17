#!/bin/bash
if test -d /sources/bash-5.0
 then
  rm -rf /sources/bash-5.0
fi

tar -xzf /sources/bash-5.0.tar.gz -C /sources/ &&

cd /sources/bash-5.0 &&

patch -Np1 -i ../bash-5.0-upstream_fixes-1.patch &&

./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.0 \
            --without-bash-malloc            \
            --with-installed-readline &&

make &&

chown -Rv nobody . &&

su nobody -s /bin/bash -c "PATH=$PATH HOME=/home make tests"

make install &&
mv -vf /usr/bin/bash /bin &&

exec /bin/bash --login +h
