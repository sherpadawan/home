#!/bin/bash

if [[ ! -f "linux-brprinter-installer-2.2.1-1" || $(ls /usr/lib64/sane/libsane-brother* &> /dev/null) == ""  ]];then
  echo -e "Make sure you runned linux-bprinter-installer-2.2.1.1 before"
  echo -e "Download it from here : https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.1-1.gz"
  exit 1
fi

#https://doc.ubuntu-fr.org/imprimantes_brother
ln -s /usr/lib64/sane/libsane-brother* /usr/lib/x86_64-linux-gnu/sane
echo "usb 0x04f9 0x0206" >> /etc/sane.d/brother3.conf 


