#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/systemd-248
 then
  rm -rf /sources/systemd-248
fi

tar xf /sources/systemd-248.tar.gz -C /sources/ &&

cd /sources/systemd-248 &&

patch -Np1 -i ../systemd-248-upstream_fixes-1.patch &&
 
sed -i 's/GROUP="render"/GROUP="video"/' rules.d/50-udev-default.rules.in &&

mkdir -p build &&
cd       build &&

LANG=en_US.UTF-8                    \
meson --prefix=/usr                 \
      --sysconfdir=/etc             \
      --localstatedir=/var          \
      -Dblkid=true                  \
      -Dbuildtype=release           \
      -Ddefault-dnssec=no           \
      -Dfirstboot=false             \
      -Dinstall-tests=false         \
      -Dldconfig=false              \
      -Dsysusers=false              \
      -Db_lto=false                 \
      -Drpmmacrosdir=no             \
      -Dhomed=false                 \
      -Duserdb=false                \
      -Dman=false                   \
      -Dmode=release                \
      -Ddocdir=/usr/share/doc/systemd-248 \
      .. &&
${log} `basename "$0"` " configured" basic &&

LANG=en_US.UTF-8 ninja &&
${log} `basename "$0"` " built" basic &&

LANG=en_US.UTF-8 ninja install &&
tar -xf ../../systemd-man-pages-248.tar.xz --strip-components=1 -C /usr/share/man &&
rm -rf /usr/lib/pam.d &&
systemd-machine-id-setup &&
systemctl preset-all &&
systemctl disable systemd-time-wait-sync.service &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/systemd-248 &&
${log} `basename "$0"` " finished" basic 
