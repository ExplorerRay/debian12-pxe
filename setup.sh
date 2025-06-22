#/bin/bash

wget https://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/netboot.tar.gz

mkdir -p tftpboot && tar -xzf netboot.tar.gz -C tftpboot

cp PXE/grub.cfg tftpboot/debian-installer/amd64/grub/grub.cfg
cp PXE/preseed.txt tftpboot/preseed.txt
cp PXE/sethostname037.sh tftpboot/sethostname.sh
