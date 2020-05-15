./toolchain01-binutils-2.34.sh &&
./toolchain02-gcc-10.1.0-pass1.sh &&
./toolchain03-linux-header-5.6.11.sh &&
./toolchain04-glibc-2.31.sh &&
./toolchain05-gcc-stdc++-10.1.0-pass1.sh &&
./toolchain06-binutils-2.34-pass2.sh &&
./toolchain07-gcc-10.1.0-pass2.sh &&
./toolchain08-tcl-8.6.10.sh &&
./toolchain09-expect-5.45.4.sh &&
./toolchain10-dejagnu-1.6.2.sh &&
./toolchain11-m4-1.4.18.sh &&
./toolchain12-ncurses-6.2.sh &&
./toolchain13-bash-5.0.sh &&
./toolchain14-bison-3.6.sh &&
./toolchain15-flex-2.6.4.sh &&
./toolchain16-bzip2-1.0.8.sh &&
./toolchain17-coreutils-8.32.sh &&
./toolchain18-diffutils-3.7.sh &&
./toolchain19-file-5.38.sh &&
./toolchain20-findutils-4.7.0.sh &&
./toolchain21-gawk-5.1.0.sh &&
./toolchain22-gettext-0.20.2.sh &&
./toolchain23-grep-3.4.sh &&
./toolchain24-gzip-1.10.sh &&
./toolchain25-make-4.3.sh &&
./toolchain26-patch-2.7.6.sh &&
./toolchain27-perl-5.30.2.sh &&
./toolchain28-python-3.8.2.sh &&
./toolchain29-sed-4.8.sh &&
./toolchain30-tar-1.32.sh &&
./toolchain31-texinfo-6.7.sh &&
./toolchain31-texinfo-6.7.sh &&
./toolchain32-util-linux-2.35.1.sh &&
./toolchain33-xz-5.2.5.sh &&
strip --strip-debug /tools/lib/* &&
strip --strip-unneeded /tools/{,s}bin/* &&
rm -rf /tools/{,share}/{info,man,doc} &&
find /tools/{lib,libexec} -name \*.la -delete

