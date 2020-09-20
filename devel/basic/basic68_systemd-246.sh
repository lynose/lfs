#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/systemd-246
 then
  rm -rf /sources/systemd-246
fi

tar xf /sources/systemd-246.tar.gz -C /sources/ &&

cd /sources/systemd-246 &&

ln -sf /bin/true /usr/bin/xsltproc &&

tar -xf ../systemd-man-pages-246.tar.xz &&

sed '177,$ d' -i src/resolve/meson.build &&
sed -i 's/GROUP="render", //' rules.d/50-udev-default.rules.in &&

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
      -Dman=true                    \
      .. &&
${log} `basename "$0"` " configured" basic &&

LANG=en_US.UTF-8 ninja &&
${log} `basename "$0"` " built" basic &&

LANG=en_US.UTF-8 ninja install &&
rm -f /usr/bin/xsltproc &&
systemd-machine-id-setup &&
systemctl preset-all &&
systemctl disable systemd-time-wait-sync.service &&
rm -f /usr/lib/sysctl.d/50-pid-max.conf &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
