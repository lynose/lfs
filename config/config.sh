#!/bin/sh
./config01_network.sh &&
#./config02_udev.sh &&
./config03_time.sh &&
./config04_console.sh &&
./config05_locales.sh &&
./config06_inputrc.sh &&
./config07_shells.sh &&
./config08_sysconf.sh &&
./config09_fstab.sh &&
./config10_lsb.sh
