#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/sed-4.8
 then
  rm -rf /sources/sed-4.8
fi

tar -xJf /sources/sed-4.8.tar.xz -C /sources &&

cd /sources/sed-4.8 &&

sed -i 's/usr/tools/'                 build-aux/help2man &&
sed -i 's/testsuite.panic-tests.sh//' Makefile.in &&
./configure --prefix=/usr --bindir=/bin &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make html &&
${log} `basename "$0"` " built html doc" target &&

chown -Rv tester . &&
su tester -c "PATH=$PATH make check" &&
${log} `basename "$0"` " checked" target &&

make install &&
install -d -m755           /usr/share/doc/sed-4.8 &&
install -m644 doc/sed.html /usr/share/doc/sed-4.8 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
