cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order
/dev/nvme0n1p8  /               ext4    defaults        1       1
/dev/nvme0n1p1  /boot/efi       vfat    umask=0077      0       1
/dev/nvme0n1p6  swap            swap    sw              0       0


# End /etc/fstab
EOF
