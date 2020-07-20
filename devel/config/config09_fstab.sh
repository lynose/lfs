cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/sdf5     /            ext4    defaults            1     1
/dev/sdb3     swap         swap    pri=1               0     0

# End /etc/fstab
EOF
