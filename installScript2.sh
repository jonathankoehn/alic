#!/bin/bash
pacman -S sudo acpid avahi cairo-dock conky cronie cups dbus  firefox gnome-extra gnome grub guake mc networkmanager network-manager-applet ntp openssh ttf-dejavu vim wget xorg-drivers xorg-server xorg-server-utils xorg-utils xorg-xinit
read -p "Enter hostname: " hname
echo "$hname" > /etc/hostname
echo KEYMAP=de-latin1 > /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime
echo "de_DE.UTF-8 UTF-8" > /etc/locale.gen
echo "de_DE ISO-8859-1" >> /etc/locale.gen
echo "de_DE@euro ISO-8859-15" >> /etc/locale.gen
locale-gen
mkinitcpio -p linux
passwd 
grub-mkconfig -o /boot/grub/grub.cfg
grub-install /dev/sda
curl -O https://raw.githubusercontent.com/jonathankoehn/alic/master/configScript.sh
chmod +x configScript.sh
