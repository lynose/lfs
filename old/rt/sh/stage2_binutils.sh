BINUTILS=2.20.1
echo $BINUTILS
cd $LFS/sources



if test -d binutils-$BINUTILS
 then
  rm -rf binutils-$BINUTILS
fi
tar xjf binutils-$BINUTILS.tar.bz2
cd binutils-$BINUTILS

if test -d binutils-build
 then
  rm -rf binutils-build
fi
mkdir -v binutils-build
cd binutils-build

CC="$LFS_TGT-gcc -B/tools/lib/" \
   AR=$LFS_TGT-ar RANLIB=$LFS_TGT-ranlib \
   ../binutils-$BINUTILS/configure --prefix=/tools \
   --disable-nls --with-lib-path=/tools/lib

make 
make install
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin
