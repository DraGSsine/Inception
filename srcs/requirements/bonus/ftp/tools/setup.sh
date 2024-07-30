#!/bin/bash

useradd -m youchen

echo "youchen:123" | chpasswd

chown youchen /home/youchen

chmod -R 755 /home/youchen

vsftpd /etc/vsftpd.conf