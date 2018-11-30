#!/bin/bash

#
# written for debina like distros 
#

user_id=$(id -u)
lxc_user_name=developer


read -p "Container name * : " name
echo "Template available "
ls -la /usr/share/lxC/templates/
read -p "Template name * : " template
read -p "Extra parameters (version: -r xenial ) : " extras

read -p "LXC user name (default=developer uid=$user_id) * : " $lxc_user_name

read -p "Hostname (default lxc.$name: " lxc_hostname
if [[ -z "$lxc_hostname" ]];then
  lxc_hostname=lxc.$name
fi


if [[ ! -z $extras  ]];then
   extras=" -- "$extras
fi

sudo lxc-create -n $name -t $template $extras

if [[ $? -ne 0 ]];then
  echo "[ERROR] An error occured exit !"
  exit 1
fi

chroot /var/lib/lxc/$name/rootfs/ /bin/bash
echo "Creating user $lxc_user_name"

useradd -u $user_id $lxc_user_name -m -g sudo

su - $lxc_user_name
echo "Choose a password for $lxc_user_name"
passwd
echo "Generating ssk keys (passphraseless works but dangerous)"
ssh-keygen

echo "Exiting from user session $lxc_user_name "
exit 
echo "Exiting chroot "
exit

echo "Modifying /etc/hosts file "
lxc_ip=$(lxc-info -n citronmauve -iH)
echo "lxc_ip $lxc_hostname" | tee -a /etc/hosts



exit 0









