#!/bin/bash
dhcpcd
sleep 10
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
curl https://raw.githubusercontent.com/jonathankoehn/conkyrc/master/conkyrcLO > /home/${username}/.conkyrcLO
curl https://raw.githubusercontent.com/jonathankoehn/conkyrc/master/conkyrcRO > /home/${username}/.conkyrcRO
curl https://raw.githubusercontent.com/jonathankoehn/conkyrc/master/conkyrcRU > /home/${username}/.conkyrcRU
rm installScript2.sh
rm configScript.sh
rm servicesToEnable
