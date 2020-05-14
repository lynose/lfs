./toolchain01-binutils-2.22.sh &&
./toolchain02-gcc-4.7.1-pass1.sh &&
./toolchain03-linux-header-3.5.2.sh &&
./toolchain04-glibc-2.16.0.sh &&
./toolchain05-binutils-2.22-pass2.sh &&
./toolchain06-gcc-4.7.1-pass2.sh &&
./toolchain07-tcl-8.5.12.sh &&
./toolchain08-expect-5.45.sh &&
./toolchain09-dejagnu-1.5.sh &&
./toolchain10-check-0.9.8.sh &&
./toolchain11-ncurses-5.9.sh &&
./toolchain12-bash-4.2.sh &&
./toolchain13-bzip2-1.0.6.sh &&
./toolchain14-coreutils-8.19.sh &&
./toolchain15-diffutils-3.2.sh &&
./toolchain16-file-5.11.sh &&
./toolchain17-findutils-4.4.2.sh &&
./toolchain18-gawk-4.0.1.sh &&
./toolchain19-gettext-0.18.1.1.sh &&
./toolchain20-grep-2.14.sh &&
./toolchain21-gzip-1.5.sh &&
./toolchain22-m4-1.4.16.sh &&
./toolchain23-make-3.82.sh &&
./toolchain24-patch-2.6.1.sh &&
./toolchain25-perl-5.16.1.sh &&
./toolchain26-sed-4.2.1.sh &&
./toolchain27-tar-1.26.sh &&
./toolchain28-texinfo-4.13a.sh &&
./toolchain29-xz-5.0.4.sh &&
strip --strip-debug /tools/lib/* &&
strip --strip-unneeded /tools/{,s}bin/* &&
rm -rf /tools/{,share}/{info,man,doc}

