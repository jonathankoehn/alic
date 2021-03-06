#!/bin/bash
mkfs.ext4 -L arch /dev/sda1
mkswap -L swap /dev/sda2
mount -L arch /mnt
swapon -L swap
curl -O https://raw.githubusercontent.com/jonathankoehn/alic/master/serverlist
echo '' > /etc/pacman.d/mirrorlist
for server in $(<serverlist); do
  echo ${server} >> /etc/pacman.d/mirrorlist
done
pacstrap /mnt base base-devel
genfstab -Lp /mnt > /mnt/etc/fstab
arch-chroot /mnt/
