#!/bin/bash

useradd -m -s youchen

echo "youchen:123" | chpasswd

vsftpd /etc/vsftpd.conf