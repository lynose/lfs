#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/dbus-1.12.18
 then
  rm -rf /sources/dbus-1.12.18
fi

tar -xzf /sources/dbus-1.12.18.tar.gz -C /sources/ &&

cd /sources/dbus-1.12.18 &&

./configure --prefix=/usr                       \
            --sysconfdir=/etc                   \
            --localstatedir=/var                \
            --disable-static                    \
            --disable-doxygen-docs              \
            --disable-xml-docs                  \
            --docdir=/usr/share/doc/dbus-1.12.18 \
            --with-console-auth-dir=/run/console &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make install &&
mv -v /usr/lib/libdbus-1.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libdbus-1.so) /usr/lib/libdbus-1.so &&
ln -sfv /etc/machine-id /var/lib/dbus &&
sed -i 's:/var/run:/run:' /lib/systemd/system/dbus.socket &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

