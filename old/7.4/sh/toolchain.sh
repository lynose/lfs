./toolchain01-binutils-2.23.2.sh &&
./toolchain02-gcc-4.8.1-pass1.sh &&
./toolchain03-linux-header-3.10.10.sh &&
./toolchain04-glibc-2.18.0.sh &&
./toolchain05-gcc-stdc++-4.8.1-pass1.sh &&
./toolchain06-binutils-2.23.2-pass2.sh &&
./toolchain07-gcc-4.8.1-pass2.sh &&
./toolchain08-tcl-8.6.0.sh &&
./toolchain09-expect-5.45.sh &&
./toolchain10-dejagnu-1.5.1.sh &&
./toolchain11-check-0.9.10.sh &&
./toolchain12-ncurses-5.9.sh &&
./toolchain13-bash-4.2.sh &&
./toolchain14-bzip2-1.0.6.sh &&
./toolchain15-coreutils-8.21.sh &&
./toolchain16-diffutils-3.3.sh &&
./toolchain17-file-5.14.sh &&
./toolchain18-findutils-4.4.2.sh &&
./toolchain19-gawk-4.1.0.sh &&
./toolchain20-gettext-0.18.3.sh &&
./toolchain21-grep-2.14.sh &&
./toolchain22-gzip-1.6.sh &&
./toolchain23-m4-1.4.16.sh &&
./toolchain24-make-3.82.sh &&
./toolchain25-patch-2.7.1.sh &&
./toolchain26-perl-5.16.1.sh &&
./toolchain27-sed-4.2.2.sh &&
./toolchain28-tar-1.26.sh &&
./toolchain29-texinfo-5.1.sh &&
./toolchain30-xz-5.0.5.sh &&
strip --strip-debug /tools/lib/* &&
strip --strip-unneeded /tools/{,s}bin/* &&
rm -rf /tools/{,share}/{info,man,doc}

