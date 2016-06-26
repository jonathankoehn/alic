#!/bin/bash
dhcpcd
sed -i '/%wheel\ ALL=(ALL)\ ALL/s/^#//' /etc/sudoers
echo "server de.pool.ntp.org" >> /etc/ntp.conf
ntpd -gq
hwclock -w
curl -O https://raw.githubusercontent.com/jonathankoehn/alic/master/servicesToEnable
for service in $(<servicesToEnable); do
  systemctl enable ${service}
done
curl https://raw.githubusercontent.com/jonathankoehn/alic/master/sshd_config > /etc/ssh/sshd_config
read -p "Enter username: " username
useradd -m -g users -s /bin/bash $username
passwd $username
gpasswd -a $username wheel
echo "AllowUsers $username" >> /etc/ssh/sshd_config
curl https://raw.githubusercontent.com/jonathankoehn/alic/master/conkyscript > /home/${username}/conkyscript
curl https://raw.githubusercontent.com/jonathankoehn/alic/master/conkyrcL > /home/${username}/.conkyrc
curl https://raw.githubusercontent.com/jonathankoehn/alic/master/conkyrcRO > /home/${username}/.conkyrcRO
curl https://raw.githubusercontent.com/jonathankoehn/alic/master/conkyrcRU > /home/${username}/.conkyrcRU
cd
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
rm package-query
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm yaourt
rm installScript2.sh
rm configScript.sh
rm servicesToEnable
