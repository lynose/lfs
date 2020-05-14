BINUTILS=2.21
echo BINUTILS
cd $LFS/sources



if test -d binutils-$BINUTILS
 then
  rm -rf binutils-$BINUTILS
fi
tar xjf packages/binutils-$BINUTILS.tar.bz2 -C . &&

if test -d binutils-build
 then
  rm -rf binutils-build
fi
mkdir -v binutils-build &&
cd binutils-build &&

../binutils-$BINUTILS/configure \
    --target=$LFS_TGT --prefix=/tools \
    --disable-nls --disable-werror &&
make &&
case $(uname -m) in
  x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

make install

