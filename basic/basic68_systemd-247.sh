#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/systemd-247
 then
  rm -rf /sources/systemd-247
fi

tar xf /sources/systemd-247.tar.gz -C /sources/ &&

cd /sources/systemd-247 &&

patch -Np1 -i ../systemd-247-upstream_fixes-2.patch &&
 
sed '181,$ d' -i src/resolve/meson.build &&
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
      -Dkmod-path=/bin/kmod         \
      -Dldconfig=false              \
      -Dmount-path=/bin/mount       \
      -Drootprefix=                 \
      -Drootlibdir=/lib             \
      -Dsplit-usr=true              \
      -Dsulogin-path=/sbin/sulogin  \
      -Dsysusers=false              \
      -Dumount-path=/bin/umount     \
      -Db_lto=false                 \
      -Drpmmacrosdir=no             \
      -Dhomed=false                 \
      -Duserdb=false                \
      -Dman=false                   \
      -Dmode=release                \
      -Ddocdir=/usr/share/doc/systemd-247 \
      .. &&
${log} `basename "$0"` " configured" basic &&

LANG=en_US.UTF-8 ninja &&
${log} `basename "$0"` " built" basic &&

LANG=en_US.UTF-8 ninja install &&
tar -xf /sources/systemd-man-pages-247-2.tar.xz --strip-components=1 -C /usr/share/man &&
rm -rf /usr/lib/pam.d &&
systemd-machine-id-setup &&
systemctl preset-all &&
systemctl disable systemd-time-wait-sync.service &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/systemd-247 &&
${log} `basename "$0"` " finished" basic 
