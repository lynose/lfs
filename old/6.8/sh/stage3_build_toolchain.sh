#!/bin/bash
echo "System will be Build in $LFS" &&
echo $LFS_TGT &&
echo $LC_ALL &&
echo $PATH &&

RUN_DIR=$PWD &&
export RUN_DIR &&
echo $RUN_DIR &&

PACKAGES=$RUN_DIR/../packages &&
export PACKAGES &&
echo $PACKAGES &&

PATCHES=$RUN_DIR/../patch &&
export PATCHES &&
echo $PATCHES

TOOLS=$LFS/tools &&
export TOOLS &&
echo $TOOLS &&

SOURCES=$LFS/sources &&
export SOURCES &&
echo $SOURCES &&
sleep 5 &&
mkdir -pv /{bin,boot,etc/opt,home,lib,mnt,opt} &&
mkdir -pv /{media/{floppy,cdrom},sbin,srv,var} &&
install -dv -m 0750 /root &&
install -dv -m 1777 /tmp /var/tmp &&
mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src} &&
mkdir -pv /usr/{,local/}share/{doc,info,locale,man} &&
mkdir -v  /usr/{,local/}share/{misc,terminfo,zoneinfo} &&
mkdir -pv /usr/{,local/}share/man/man{1..8} &&
for dir in /usr /usr/local; do
  ln -fsv share/{man,doc,info} $dir
done
case $(uname -m) in
 x86_64) ln -sv lib /lib64 && ln -sv lib /usr/lib64 ;;
esac
mkdir -v /var/{lock,log,mail,run,spool} &&
mkdir -pv /var/{opt,cache,lib/{misc,locate},local} &&
ln -fsv /tools/bin/{bash,cat,echo,pwd,stty} /bin &&
ln -fsv /tools/bin/perl /usr/bin &&
ln -fsv /tools/lib/libgcc_s.so{,.1} /usr/lib &&
ln -fsv /tools/lib/libstdc++.so{,.6} /usr/lib &&
ln -fsv bash /bin/sh &&
touch /etc/mtab &&
cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF

cat > /etc/group << "EOF"
root:x:0:
bin:x:1:
sys:x:2:
kmem:x:3:
tty:x:4:
tape:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
mail:x:34:
nogroup:x:99:
EOF

exec /tools/bin/bash --login +h
