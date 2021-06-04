#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/dbus-1.12.20
 then
  rm -rf /sources/dbus-1.12.20
fi

tar xf /sources/dbus-1.12.20.tar.gz -C /sources/ &&

cd /sources/dbus-1.12.20 &&

./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --disable-static                     \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --docdir=/usr/share/doc/dbus-1.12.20 \
            --with-console-auth-dir=/run/console \
            --with-system-pid-file=/run/dbus/pid \
            --with-system-socket=/run/dbus/system_bus_socket &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make install &&
ln -sfv /etc/machine-id /var/lib/dbus &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/dbus-1.12.20 &&
${log} `basename "$0"` " finished" basic 

