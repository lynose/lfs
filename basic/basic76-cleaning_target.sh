#!/bin/bash
find /usr/lib /usr/libexec -name \*.la -delete &&
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf &&
rm -rf /tools &&
userdel -r tester
