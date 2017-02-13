# alic
Scripts for customised Arch Linux installation  
NO, it might not be the perfect script yet and probably will be improved in future, but it works perfectly.  
NO, it's not the perfect configuration for everybody. It's adjusted to my needs.

1. Boot the computer or VM from an Arch Linux ISO image.
2. Set up the disk `gdisk /dev/sda`. 
The provided script expects the following configuration:  
/dev/sda1 , root partition, hex code: 8300  
/dev/sda2 , swap partition, hex code: 8200  
/dev/sda3 , boot partition, hex code: ef02, 3MB

3. Setup internet connection `dhcpcd`.
  * If DHCP is not configured:  
  `ip addr add <host ip>/<netmask> dev < dev name>`  
  `ip route add default via <gateway>`  
  `ip link set <dev name> up`  
  `echo "nameserver <dns>" >> /etc/resolv.conf`  
 
4. Download and start the first script  
`curl -O https://raw.githubusercontent.com/jonathankoehn/alic/master/installScript.sh`  
`chmod +x installScript.sh`  
`./installScript.sh`

5. Download and start the second script  
`curl -O https://raw.githubusercontent.com/jonathankoehn/alic/master/installScript2.sh`  
`chmod +x installScript2.sh`  
`./installScript2.sh`

6. When you are asked to, enter the desired hostname and root password.
7. Unmount the file system and reboot.  
`exit`  
`umount /dev/sda1`  
`reboot`  
If you didn't remove the Arch Linux stick/CD, now choose "Boot existing OS" in the menu.

8. Log in as "root" with the password set before.
9. Run the third script `/configScript.sh`.

10. Enter name and password for an user account. This user has sudo permissions after running the script.
