#!/bin/bash

# Configure vsftpd
cat > /etc/vsftpd.conf <<EOF
# Allow anonymous FTP
anonymous_enable=YES

# Enable local users
local_enable=YES

# Enable write access
write_enable=YES

# Disable chroot (allows users to access directories outside their home)
chroot_local_user=NO

# Enable logging
xferlog_enable=YES

# Listen on IPv4
listen=YES

# Disable SSL
ssl_enable=NO

# Allow directory messages
dirmessage_enable=YES

# Allow FTP data connections
connect_from_port_20=YES

# Passive mode settings (adjust these ports if needed)
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30050
EOF
mkdir -p /var/run/vsftpd/empty
exec vsftpd /etc/vsftpd.conf