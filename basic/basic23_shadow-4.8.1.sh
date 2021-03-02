#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/shadow-4.8.1
 then
  rm -rf /sources/shadow-4.8.1
fi
tar xf /sources/shadow-4.8.1.tar.xz -C /sources/ &&
cd /sources/shadow-4.8.1 &&

sed -i 's/groups$(EXEEXT) //' src/Makefile.in &&
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \; &&
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; &&
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \; &&

sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -i etc/login.defs &&
       
sed -i 's@DICTPATH.*@DICTPATH\t/lib/cracklib/pw_dict@' etc/login.defs &&

sed -i 's/1000/999/' etc/useradd &&

touch /usr/bin/passwd &&
./configure --sysconfdir=/etc \
            --with-group-name-max-length=32 &&
${log} `basename "$0"` " configured" basic &&


make &&
${log} `basename "$0"` " built" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
pwconv &&

grpconv &&

sed -i 's/yes/no/' /etc/default/useradd &&

passwd root

rm -rf /sources/shadow-4.8.1 &&
${log} `basename "$0"` " finished" basic 
