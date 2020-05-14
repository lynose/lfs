#!/bin/bash
if test -d /sources/shadow-4.1.5.1
 then
  rm -rf /sources/shadow-4.1.5.1
fi
tar -xjf /sources/shadow-4.1.5.1.tar.bz2 -C /sources/ &&
cd /sources/shadow-4.1.5.1 &&
sed -i 's/groups$(EXEEXT) //' src/Makefile.in &&
find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \;
sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs &&
sed -i 's@DICTPATH.*@DICTPATH\t/lib/cracklib/pw_dict@' \
    etc/login.defs &&
./configure --sysconfdir=/etc &&
make &&
make install &&
mv -v /usr/bin/passwd /bin &&
pwconv &&
grpconv &&
passwd root