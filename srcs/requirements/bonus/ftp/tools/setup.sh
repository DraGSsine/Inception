#!/bin/bash

useradd -m youchen

echo "youchen:123" | chpasswd

chown -R youchen /home/youchen

vsftpd /etc/vsftpd.conf