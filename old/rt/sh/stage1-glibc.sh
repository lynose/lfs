GLIBC_VERSION=2.12.1
echo BINUTILS
cd $LFS/sources



if test -d glibc-$GLIBC_VERSION
 then
  rm -rf glibc-$GLIBC_VERSION
fi
tar xjf glibc-$GLIBC_VERSION.tar.bz2

if test -d glibc-build
 then
  rm -rf glibc-build
fi
mkdir -v glibc-build

cd  glibc-$GLIBC_VERSION
patch -Np1 -i ../glibc-2.12.1-gcc_fix-1.patch
patch -Np1 -i ../glibc-2.12.1-makefile_fix-1.patch

cd ../glibc-build

case `uname -m` in
  i?86) echo "CFLAGS += -march=i486 -mtune=native" > configparms ;;
esac

../glibc-$GLIBC_VERSION/configure --prefix=/tools \
    --host=$LFS_TGT --build=$(../glibc-2.12.1/scripts/config.guess) \
    --disable-profile --enable-add-ons \
    --enable-kernel=2.6.22.5 --with-headers=/tools/include \
    libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes
make 

make install
