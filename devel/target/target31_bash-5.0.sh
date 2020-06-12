#!/bin/bash
${log} `basename "$0"` " started" target &&
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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

#chown -Rv tester . &&
#su tester << EOF
#PATH=$PATH make tests < $(tty)
#EOF 
${log} `basename "$0"` " check with unkown results" target


make install &&
mv -vf /usr/bin/bash /bin &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target &&

exec /bin/bash --login +h #Must run at last
