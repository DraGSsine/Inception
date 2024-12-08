#!/bin/bash

useradd -m $USER

echo "$USER:$PASS" | chpasswd

chown -R youchen /home/youchen

vsftpd /etc/vsftpd.conf