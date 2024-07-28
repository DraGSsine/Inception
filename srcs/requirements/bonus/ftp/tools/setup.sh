#!/bin/bash

useradd -m youchen

echo "youchen:123" | chpasswd

vsftpd /etc/vsftpd.conf