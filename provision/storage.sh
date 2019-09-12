#!/bin/bash

apt-get install -y vim nfs-kernel-server

mkdir -p /volumes/v{0,1,2,3,4,5,6,7,8,9}

cat > /etc/exports <<EOF
/volumes/v0 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v1 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v2 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v3 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v4 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v5 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v6 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v7 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v8 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
/volumes/v9 27.11.90.0/255.255.255.0(rw,no_root_squash,no_subtree_check)
EOF

exportfs -a
