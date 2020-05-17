#!/bin/bash
if test -d /sources/gcc-10.1.0
 then
  rm -rf /sources/gcc-10.1.0
fi

tar -xJf /sources/gcc-10.1.0.tar.xz -C /sources &&

cd /sources/gcc-10.1.0 &&

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

if test -d ../gcc-build
 then
  rm -rf ../gcc-build
fi
mkdir -v ../gcc-build &&
cd ../gcc-build &&
SED=sed                               \ 
../gcc-10.1.0/configure --prefix=/usr \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib &&
make &&

ulimit -s 32768 &&

chown -Rv nobody . &&
su nobody -s /bin/bash -c "PATH=$PATH make -k check"

../gcc-10.1.0/contrib/test_summary &&

make install &&
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/10.1.0/include-fixed/bits/ &&

chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/10.1.0/include{,-fixed} &&

ln -sv ../usr/bin/cpp /lib &&

ln -sv gcc /usr/bin/cc &&

install -v -dm755 /usr/lib/bfd-plugins &&
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/10.1.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/ &&
        
echo 'int main(){}' > dummy.c &&
cc dummy.c -v -Wl,--verbose &> dummy.log &&
readelf -l a.out | grep ': /lib' &&

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log &&

grep -B4 '^ /usr/include' dummy.log &&

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' &&

grep "/lib.*/libc.so.6 " dummy.log &&

grep found dummy.log &&

rm -v dummy.c a.out dummy.log &&

mkdir -pv /usr/share/gdb/auto-load/usr/lib &&

mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

