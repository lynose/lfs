${log} `basename "$0"` " ======================================" crosstemp &&
${log} `basename "$0"`  "Started CrossTemp build in $LFS" crosstemp &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp01-m4-1.4.18.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp02-ncurses-6.2.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp03-bash-5.1.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp04-coreutils-8.32.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp05-diffutils-3.7.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp06-file-5.39.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp07-findutils-4.8.0.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp08-gawk-5.1.0.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp09-grep-3.6.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp10-gzip-1.10.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp11-make-4.3.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp12-patch-2.7.6.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp13-sed-4.8.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp14-tar-1.34.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp15-xz-5.2.5.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp16-binutils-2.36.1-pass2.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
./crosstemp17-gcc-10.2.0-pass2.sh &&
${log} `basename "$0"` " ======================================" crosstemp &&
${log} `basename "$0"` " Finished Crosstemp build in $LFS" crosstemp
