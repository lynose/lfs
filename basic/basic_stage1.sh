${log} `basename "$0"` " ======================================" basic &&
${log} `basename "$0"`  "Global config" basic &&
${log} `basename "$0"` " ======================================" basic &&
export WORKDIR=$(pwd) &&
${log} `basename "$0"` " ======================================" basic &&
${log} `basename "$0"`  "Started Basic System build" basic &&
${log} `basename "$0"` " ======================================" basic &&

./basic01_man-pages-5.10.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic02_iana-etc-20210304.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic03_glibc-2.33.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic04_zlib-1.2.11.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic05_bzip2-1.0.8.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic06_xz-5.2.5.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic07_zstd-1.4.9.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic08_file-5.39.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic09_readline-8.1.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic10_m4-1.4.18.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic11_bc-3.3.3.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic12_flex-2.6.4.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic13_tcl-8.6.11.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic14_expect-5.45.4.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic15_dejagnu-1.6.2.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic16_binutils-2.36.1.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic17_gmp-6.2.1.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic18_mpfr-4.1.0.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic19_mpc-1.2.1.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic20_attr-2.5.0.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic21_acl-2.3.0.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic22_libcap-2.49.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic23_shadow-4.8.1.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic24_gcc-10.2.0.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic25_pkg-config-0.29.2.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic26_ncurses-6.2.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic27_sed-4.8.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic28_psmisc-23.4.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic29_gettext-0.21.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic30_bison-3.7.6.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic31_grep-3.6.sh &&
${log} `basename "$0"` " ======================================" basic &&
./basic32_bash-5.1.sh

echo "If you see this before logout, execute: exec /bin/bash --login +h"
