#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/acl-2.2.53
 then
  rm -rf /sources/acl-2.2.53
fi

tar -xzf /sources/acl-2.2.53.tar.gz -C /sources &&

cd /sources/acl-2.2.53 &&

./configure --prefix=/usr         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53 &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
mv -v /usr/lib/libacl.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/acl-2.2.53
${log} `basename "$0"` " finished" basic 
