#!/bin/bash
if test -d $LFS/sources/gcc-4.7.1
 then
  rm -rf $LFS/sources/gcc-4.7.1
fi

tar -xjf $LFS/sources/gcc-4.7.1.tar.bz2 -C $LFS/sources/

cd $LFS/sources/gcc-4.7.1 &&

tar -Jxf ../mpfr-3.1.1.tar.xz &&
mv -v mpfr-3.1.1 mpfr &&
tar -Jxf ../gmp-5.0.5.tar.xz &&
mv -v gmp-5.0.5 gmp &&
tar -zxf ../mpc-1.0.tar.gz &&
mv -v mpc-1.0 mpc &&

for file in \
 $(find gcc/config -name linux64.h -o -name linux.h -o -name sysv4.h)
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

sed -i '/k prot/agcc_cv_libc_provides_ssp=yes' gcc/configure &&

if test -d ../gcc-build
 then
  rm -rf ../gcc-build
fi
mkdir -v ../gcc-build &&
cd ../gcc-build &&

../gcc-4.7.1/configure         \
    --target=$LFS_TGT          \
    --prefix=/tools            \
    --with-sysroot=$LFS        \
    --with-newlib              \
    --without-headers          \
    --with-local-prefix=/tools \
    --with-native-system-header-dir=/tools/include \
    --disable-nls              \
    --disable-shared           \
    --disable-multilib         \
    --disable-decimal-float    \
    --disable-threads          \
    --disable-libmudflap       \
    --disable-libssp           \
    --disable-libgomp          \
    --disable-libquadmath      \
    --enable-languages=c       \
    --with-mpfr-include=$(pwd)/../gcc-4.7.1/mpfr/src \
    --with-mpfr-lib=$(pwd)/mpfr/src/.libs &&
make &&
make install &&
ln -vs libgcc.a `$LFS_TGT-gcc -print-libgcc-file-name | sed 's/libgcc/&_eh/'`
