#!/bin/bash

sudo ip link set dev tap0 down
sudo ip link delete tap0

sudo ip link set dev tap1 down
sudo ip link delete tap1

sudo ip link set br0 down
sudo ip link delete br0
sudo ip addr add 192.168.1.3/24 dev enp2s3
sudo ip link set enp2s3 up
sudo ip route add default via 192.168.1.1
