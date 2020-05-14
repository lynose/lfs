
GCC_CROSS=4.5.2

cd $LFS/sources



if test -d gcc-$GCC_CROSS
 then
   rm -rf gcc-$GCC_CROSS
fi
tar xjf packages/gcc-$GCC_CROSS.tar.bz2 -C . &&

if test -d gcc-build
 then
  rm -rf gcc-build 
fi
mkdir -v gcc-build &&

cd gcc-$GCC_CROSS &&

tar -jxf ../packages/mpfr-3.0.0.tar.bz2 -C . &&
mv -v mpfr-3.0.0 mpfr &&
tar -jxf ../packages/gmp-5.0.1.tar.bz2 -C .&&
mv -v gmp-5.0.1 gmp &&
tar -jxf ../packages/mpc-0.8.2.tar.bz2 -C .&&
mv -v mpc-0.8.2 mpc &&

cd ../gcc-build &&

../gcc-4.5.2/configure \
    --target=$LFS_TGT --prefix=/tools \
    --disable-nls --disable-shared --disable-multilib \
    --disable-decimal-float --disable-threads \
    --disable-libmudflap --disable-libssp \
    --disable-libgomp --enable-languages=c \
    --with-gmp-include=/lfs/sources/gcc-$GCC_CROSS/gmp --with-gmp-lib=/lfs/sources/gcc-$GCC_CROSS/gmp/.libs \
    --without-ppl --without-cloog &&

make &&
make install &&
 
ln -vs libgcc.a `$LFS_TGT-gcc -print-libgcc-file-name | \
    sed 's/libgcc/&_eh/'`