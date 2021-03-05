#!/bin/bash

umount $LFS/dev{/pts,} &&
umount $LFS/{sys,proc,run}
