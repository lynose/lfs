${log} `basename "$0"` " ======================================" toolchain &&
${log} `basename "$0"`  "Started Toolchain build in $LFS" toolchain &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain01-binutils-2.34.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain02-gcc-10.1.0-pass1.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain03-linux-header-5.6.13.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain04-glibc-2.31.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain05-gcc-stdc++-10.1.0-pass1.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain06-binutils-2.34-pass2.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain07-gcc-10.1.0-pass2.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain08-tcl-8.6.10.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain09-expect-5.45.4.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain10-dejagnu-1.6.2.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain11-m4-1.4.18.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain12-ncurses-6.2.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain13-bash-5.0.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain14-bison-3.6.1.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain15-flex-2.6.4.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain16-bzip2-1.0.8.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain17-coreutils-8.32.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain18-diffutils-3.7.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain19-file-5.38.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain20-findutils-4.7.0.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain21-gawk-5.1.0.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain22-gettext-0.20.2.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain23-grep-3.4.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain24-gzip-1.10.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain25-make-4.3.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain26-patch-2.7.6.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain27-perl-5.30.2.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain28-python-3.8.3.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain29-sed-4.8.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain30-tar-1.32.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain31-texinfo-6.7.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain31-texinfo-6.7.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain32-util-linux-2.35.1.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
./toolchain33-xz-5.2.5.sh &&
${log} `basename "$0"` " ======================================" toolchain &&
${log} `basename "$0"` " Stripping" toolchain &&
strip --strip-debug /tools/lib/* &&
strip --strip-unneeded /tools/{,s}bin/* &&
rm -rf /tools/{,share}/{info,man,doc} &&
find /tools/{lib,libexec} -name \*.la -delete
${log} `basename "$0"` " Finished Toolchain build in $LFS" toolchain
