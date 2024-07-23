#!/bin/bash


sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf

sed -i 's/daemonize yes/daemonize no/' /etc/redis/redis.conf

redis-server /etc/redis/redis.conf