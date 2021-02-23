#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bash-5.1
 then
  rm -rf /sources/bash-5.1
fi

tar -xzf /sources/bash-5.1.tar.gz -C /sources/ &&

cd /sources/bash-5.1 &&

sed -i  '/^bashline.o:.*shmbchar.h/a bashline.o: ${DEFDIR}/builtext.h' Makefile.in &&

./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.1 \
            --without-bash-malloc            \
            --with-installed-readline &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&


chown -Rv tester . &&

su tester << EOF
PATH=$PATH make tests < $(tty)
EOF

make install &&
mv -vf /usr/bin/bash /bin &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic &&

exec /bin/bash --login +h #Must run at last
