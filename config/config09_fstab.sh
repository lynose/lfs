cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
UUID=2cc71975-dde3-496b-b43c-a6e91addb5c8       /           ext4    errors=remount-ro 0       1
UUID=B0D7-FF0B                                  /boot/efi   vfat    umask=0077        0       1
UUID=81ef99d4-1a4d-4b7a-ae0b-a1f216c144bd       none        swap    sw                0       0
UUID=e063e77d-904c-45a1-a453-590c11f5a3d9       /lfs        ext4    default           0       1

# End /etc/fstab
EOF
