#!/bin/bash

growpart /dev/nvme0n1 4
lvextend -l +50%FREE /dev/RootVG/rootVol
lvextend -l +50%FREE /dev/RootVG/varVol
xfs_growfs /
xfs_growfs /var

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# sudo growpart /dev/nvme0n1 4
# sudo xfs_growfs -d /

# aws ec2 modify-volume \
# --volume-id vol-01d8113b317916c88 \
# --size 50

# aws ec2 describe-volumes-modifications \
# --volume-id vol-01d8113b317916c88

# vol-01d8113b317916c88

# sudo dnf install cloud-utils-growpart -y
# sudo growpart /dev/nvme0n1 4
# df -Th
# sudo resize2fs /dev/nvme0n1p4

#kubectl install
