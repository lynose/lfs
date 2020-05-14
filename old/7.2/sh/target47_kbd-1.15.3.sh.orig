#!/bin/bash
if test -d /sources/kbd-1.15.3
 then
  rm -rf /sources/kbd-1.15.3
fi
tar -xzf /sources/kbd-1.15.3.tar.gz -C /sources/ &&
cd /sources/kbd-1.15.3 &&
patch -Np1 -i ../kbd-1.15.3-upstream_fixes-1.patch &&
patch -Np1 -i ../kbd-1.15.3-backspace-1.patch &&
sed -i '/guardado\ el/s/\(^.*en\ %\)\(.*\)/\14\$\2/' po/es.po &&
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/' configure &&
sed -i 's/resizecons.8 //' man/man8/Makefile.in &&
touch -d '2011-05-07 08:30' configure.ac &&
./configure --prefix=/usr --datadir=/lib/kbd &&
make &&
make install &&
mv -v /usr/bin/{kbd_mode,loadkeys,openvt,setfont} /bin &&
mkdir -v /usr/share/doc/kbd-1.15.3 &&
cp -R -v doc/* \
         /usr/share/doc/kbd-1.15.3