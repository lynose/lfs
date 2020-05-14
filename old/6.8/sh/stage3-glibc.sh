#!/bin/bash
RUN_DIR=$PWD &&
export RUN_DIR &&
echo $RUN_DIR &&

PACKAGES=$RUN_DIR/../packages &&
export PACKAGES &&
echo $PACKAGES &&

PATCHES=$RUN_DIR/../patch &&
export PATCHES &&
echo $PATCHES

SOURCES=$LFS/sources &&
export SOURCES &&
echo $SOURCES &&

GLIBC_VERSION=2.13 &&
export GLIBC_VERSION &&
echo $GLIBC_VERSION &&

echo $LFS_TGT &&

sleep 10 &&

if test -d $SOURCES/glibc-$GLIBC_VERSION
 then
  rm -rf $SOURCES/glibc-$GLIBC_VERSION
fi
tar xjf $PACKAGES/glibc-$GLIBC_VERSION.tar.bz2 -C $SOURCES &&

if test -d $SOURCES/glibc-build
 then
  rm -rf $SOURCES/glibc-build
fi
mkdir $SOURCES/glibc-build &&

cd  $SOURCES/glibc-$GLIBC_VERSION &&
DL=$(readelf -l /bin/sh | sed -n 's@.*interpret.*/tools\(.*\)]$@\1@p') &&
sed -i "s|libs -o|libs -L/usr/lib -Wl,-dynamic-linker=$DL -o|" \
        scripts/test-installation.pl &&
unset DL &&
sed -i -e 's/"db1"/& \&\& $name ne "nss_test1"/' scripts/test-installation.pl &&
sed -i 's|@BASH@|/bin/bash|' elf/ldd.bash.in &&
patch -Np1 -i $PATCHES/glibc-$GLIBC_VERSION-gcc_fix-1.patch &&
sed -i '195,213 s/PRIVATE_FUTEX/FUTEX_CLOCK_REALTIME/' \
nptl/sysdeps/unix/sysv/linux/x86_64/pthread_rwlock_timed{rd,wr}lock.S &&

cd $SOURCES/glibc-build &&

case `uname -m` in
  i?86) echo "CFLAGS += -march=i486 -mtune=native -O3 -pipe" > configparms ;;
esac

../glibc-$GLIBC_VERSION/configure --prefix=/usr \
    --disable-profile --enable-add-ons \
    --enable-kernel=2.6.22.5 --libexecdir=/usr/lib/glibc &&
make &&
cp -v ../glibc-$GLIBC_VERSION/iconvdata/gconv-modules iconvdata &&
make -k check 2>&1 | tee glibc-check-log &&
grep Error glibc-check-log &&
touch /etc/ld.so.conf &&
make install &&

mkdir -pv /usr/lib/locale &&
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8 &&
localedef -i de_DE -f ISO-8859-1 de_DE &&
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro &&
localedef -i de_DE -f UTF-8 de_DE.UTF-8 &&
localedef -i en_HK -f ISO-8859-1 en_HK &&
localedef -i en_PH -f ISO-8859-1 en_PH &&
localedef -i en_US -f ISO-8859-1 en_US &&
localedef -i en_US -f UTF-8 en_US.UTF-8 &&
localedef -i es_MX -f ISO-8859-1 es_MX &&
localedef -i fa_IR -f UTF-8 fa_IR &&
localedef -i fr_FR -f ISO-8859-1 fr_FR &&
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro &&
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8 &&
localedef -i it_IT -f ISO-8859-1 it_IT &&
localedef -i ja_JP -f EUC-JP ja_JP &&
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8 && 
localedef -i zh_CN -f GB18030 zh_CN.GB18030 &&
make localedata/install-locales &&
cat > /etc/nsswitch.conf << "EOF"
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
tzselect &&
cp -v --remove-destination /usr/share/zoneinfo/Europe/Berlin \
    /etc/localtime &&
cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf

/usr/local/lib
/opt/lib

# End /etc/ld.so.conf
EOF