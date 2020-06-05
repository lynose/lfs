${log} `basename "$0"` " ======================================" target &&
${log} `basename "$0"`  "Started Toolchain build in $LFS" target &&
${log} `basename "$0"` " ======================================" target &&
./target02_linux-header-5.6.15.sh &&
${log} `basename "$0"` " ======================================" target &&
./target03_man-pages-5.06.sh &&
${log} `basename "$0"` " ======================================" target &&
./target04_glibc-2.31.sh &&
${log} `basename "$0"` " ======================================" target &&
./target05_adjust_toolchain.sh &&
${log} `basename "$0"` " ======================================" target &&
./target06_zlib-1.2.11.sh &&
${log} `basename "$0"` " ======================================" target &&
./target07_bzip2-1.0.8.sh &&
${log} `basename "$0"` " ======================================" target &&
./target08_xz-5.2.5.sh &&
${log} `basename "$0"` " ======================================" target &&
./target08_1_zstd-1.4.5.sh &&
${log} `basename "$0"` " ======================================" target &&
./target09_file-5.38.sh &&
${log} `basename "$0"` " ======================================" target &&
./target10_readline-8.0.sh &&
${log} `basename "$0"` " ======================================" target &&
./target11_m4-1.4.18.sh &&
${log} `basename "$0"` " ======================================" target &&
./target12_bc-2.7.2.sh &&
${log} `basename "$0"` " ======================================" target &&
./target12_1_flex-2.6.4.sh &&
${log} `basename "$0"` " ======================================" target &&
./target13_binutils-2.34.sh &&
${log} `basename "$0"` " ======================================" target &&
./target14_gmp-6.2.0.sh &&
${log} `basename "$0"` " ======================================" target &&
./target15_mpfr-4.0.2.sh &&
${log} `basename "$0"` " ======================================" target &&
./target16_mpc-1.1.0.sh &&
${log} `basename "$0"` " ======================================" target &&
./target17_attr-2.4.48.sh &&
${log} `basename "$0"` " ======================================" target &&
./target18_acl-2.2.53.sh &&
${log} `basename "$0"` " ======================================" target &&
./target19_libcap-2.36.sh &&
${log} `basename "$0"` " ======================================" target &&
./target20_shadow-4.8.1.sh &&
${log} `basename "$0"` " ======================================" target &&
./target21_gcc-10.1.0.sh &&
${log} `basename "$0"` " ======================================" target &&
./target22_pkg-config-0.29.2.sh &&
${log} `basename "$0"` " ======================================" target &&
./target23_ncurses-6.2.sh &&
${log} `basename "$0"` " ======================================" target &&
./target24_sed-4.8.sh &&
${log} `basename "$0"` " ======================================" target &&
./target25_psmisc-23.3.sh &&
${log} `basename "$0"` " ======================================" target &&
./target26_iana-etc-20200429.sh &&
${log} `basename "$0"` " ======================================" target &&
./target27_gettext-0.20.2.sh &&
${log} `basename "$0"` " ======================================" target &&
./target28_bison-3.6.3.sh &&
${log} `basename "$0"` " ======================================" target &&
./target30_grep-3.4.sh &&
${log} `basename "$0"` " ======================================" target &&
./target31_bash-5.0.sh

echo "If you see this before logout, execute: exec /bin/bash --login +h"
