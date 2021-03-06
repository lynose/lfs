#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gcc-10.2.0
 then
  rm -rf /sources/gcc-10.2.0
fi

tar -xJf /sources/gcc-10.2.0.tar.xz -C /sources &&

cd /sources/gcc-10.2.0 &&

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir -v build &&
cd build &&
../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

ulimit -s 32768 &&

chown -Rv tester . &&
su tester -c "PATH=$PATH make -k check" &&
${log} `basename "$0"` " Unexpected succeeded" basic

../gcc-10.2.0/contrib/test_summary

make install &&
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/10.2.0/include-fixed/bits/ &&
chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/10.2.0/include{,-fixed} &&
ln -sv ../usr/bin/cpp /lib &&

install -v -dm755 /usr/lib/bfd-plugins &&
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/10.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/ &&
${log} `basename "$0"` " installed" basic &&
        
echo 'int main(){}' > dummy.c &&
cc dummy.c -v -Wl,--verbose &> /log/dummy.log &&
readelf -l a.out | grep ': /lib' &&
grep -o '/usr/lib.*/crt[1in].*succeeded' /log/dummy.log &&
grep -B4 '^ /usr/include' /log/dummy.log &&
grep 'SEARCH.*/usr/lib' /log/dummy.log |sed 's|; |\n|g' &&
grep "/lib.*/libc.so.6 " /log/dummy.log &&
grep found /log/dummy.log &&
rm -v dummy.c a.out /log/dummy.log &&
mkdir -pv /usr/share/gdb/auto-load/usr/lib &&
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib &&

rm -rf /sources/gcc-10.2.0 &&
${log} `basename "$0"` " finished" basic 
