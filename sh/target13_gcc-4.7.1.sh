#!/bin/bash
if test -d /sources/gcc-4.7.1
 then
  rm -rf /sources/gcc-4.7.1
fi
tar -xjf /sources/gcc-4.7.1.tar.bz2 -C /sources &&
cd /sources/gcc-4.7.1 &&
sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in &&
case `uname -m` in
  i?86) sed -i 's/^T_CFLAGS =$/& -fomit-frame-pointer/' gcc/Makefile.in ;;
esac
sed -i -e /autogen/d -e /check.sh/d fixincludes/Makefile.in &&
if test -d ../gcc-build
 then
  rm -rf ../gcc-build
fi
mkdir -v ../gcc-build &&
cd ../gcc-build &&
../gcc-4.7.1/configure --prefix=/usr            \
                       --libexecdir=/usr/lib    \
                       --enable-shared          \
                       --enable-threads=posix   \
                       --enable-__cxa_atexit    \
                       --enable-clocale=gnu     \
                       --enable-languages=c,c++ \
                       --disable-multilib       \
                       --disable-bootstrap      \
                       --with-system-zlib &&
make &&
ulimit -s 32768 &&
make -k check
../gcc-4.7.1/contrib/test_summary
make install &&
ln -sv ../usr/bin/cpp /lib &&
ln -sv gcc /usr/bin/cc &&
cd /root &&
echo 'main(){}' > dummy.c &&
cc dummy.c -v -Wl,--verbose &> dummy.log &&
readelf -l a.out | grep ': /lib' &&
grep -B4 '^ /usr/include' dummy.log &&
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' &&
grep "/lib.*/libc.so.6 " dummy.log &&
grep found dummy.log &&
rm -v dummy.c a.out dummy.log &&
mkdir -pv /usr/share/gdb/auto-load/usr/lib &&
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib 