#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/gcc-11.1.0
 then
  rm -rf /sources/gcc-11.1.0
fi

tar -xJf /sources/gcc-11.1.0.tar.xz -C /sources &&

cd /sources/gcc-11.1.0 &&

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

../contrib/test_summary > /log/gcc.log &&

make install &&
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/11.1.0/include-fixed/bits/ &&
chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/11.1.0/include{,-fixed} &&
ln -svr /usr/bin/cpp /usr/lib &&

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/11.1.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/ &&
${log} `basename "$0"` " installed" basic &&
        
echo 'int main(){}' > dummy.c &&
cc dummy.c -v -Wl,--verbose &> /log/dummy.log &&
readelf -l a.out | grep ': /lib' > /log/gcc-test.log &&
grep -o '/usr/lib.*/crt[1in].*succeeded' /log/dummy.log >> /log/gcc-test.log &&
grep -B4 '^ /usr/include' /log/dummy.log >> /log/gcc-test.log &&
grep 'SEARCH.*/usr/lib' /log/dummy.log |sed 's|; |\n|g' >> /log/gcc-test.log &&
grep "/lib.*/libc.so.6 " /log/dummy.log >> /log/gcc-test.log &&
grep found /log/dummy.log >> /log/gcc-test.log &&
rm -v dummy.c a.out /log/dummy.log &&
mkdir -pv /usr/share/gdb/auto-load/usr/lib &&
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib &&

cd $WORKDIR &&
rm -rf /sources/gcc-11.1.0 &&
${log} `basename "$0"` " finished" basic 
