${log} `basename "$0"` " ======================================" roottools &&
${log} `basename "$0"`  "Started roottools build" roottools &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools03-gcc-stdc++-10.2.0-pass2.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools04-gettext-0.21.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools05-bison-3.7.1.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools06-perl-5.32.0.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools07-python-3.8.5.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools08-texinfo-6.7.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools09-util-linux-2.36.0.sh &&
${log} `basename "$0"` " ======================================" roottools &&
${log} `basename "$0"` " Stripping" roottools &&
${log} `basename "$0"` " ======================================" roottools &&
find /usr/{lib,libexec} -name \*.la -delete
${log} `basename "$0"` " Finished roottools build" roottools
