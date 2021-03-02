#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/glibc-2.33
 then
  rm -rf /sources/glibc-2.33
fi
tar -xJf /sources/glibc-2.33.tar.xz -C /sources/ &&
cd /sources/glibc-2.33 &&

patch -Np1 -i ../glibc-2.33-fhs-1.patch &&

sed -e '402a\      *result = local->data.services[database_index];' \
    -i nss/nss_database.c &&

mkdir -v build &&
cd build &&

../configure --prefix=/usr                            \
             --disable-werror                         \
             --enable-kernel=3.2                      \
             --enable-stack-protector=strong          \
             --with-headers=/usr/include              \
             libc_cv_slibdir=/lib &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&          #Ignoring result, not related to multithread
${log} `basename "$0"` " Unexpected Test succeeded" basic
${log} `basename "$0"` " expected test fail?" basic

touch /etc/ld.so.conf &&
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile &&
make install &&
${log} `basename "$0"` " installed base" basic &&

cp -v ../nscd/nscd.conf /etc/nscd.conf &&
mkdir -pv /var/cache/nscd &&

install -v -Dm644 ../nscd/nscd.tmpfiles /usr/lib/tmpfiles.d/nscd.conf &&
install -v -Dm644 ../nscd/nscd.service /lib/systemd/system/nscd.service &&

mkdir -pv /usr/lib/locale &&
localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true &&
localedef -i de_DE -f ISO-8859-1 de_DE &&
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro &&
localedef -i de_DE -f UTF-8 de_DE.UTF-8 &&
localedef -i en_GB -f UTF-8 en_GB.UTF-8 &&
localedef -i en_US -f ISO-8859-1 en_US &&
localedef -i en_US -f UTF-8 en_US.UTF-8 &&

cat > /etc/nsswitch.conf << "EOF" &&
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

tar -xf ../../tzdata2021a.tar.gz &&

ZONEINFO=/usr/share/zoneinfo &&
mkdir -pv $ZONEINFO/{posix,right} &&

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz} &&
    zic -L /dev/null   -d $ZONEINFO/posix ${tz} &&
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done

cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO &&
zic -d $ZONEINFO -p America/New_York &&
unset ZONEINFO &&

ln -sfv /usr/share/zoneinfo/Europe/Berlin /etc/localtime &&

cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib
EOF

cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf
EOF
mkdir -pv /etc/ld.so.conf.d &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/glibc-2.33 &&
${log} `basename "$0"` " finished" basic 
