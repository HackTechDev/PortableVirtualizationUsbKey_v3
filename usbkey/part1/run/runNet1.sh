#!/bin/bash

sudo ip link delete docker0 

echo "Initialize Network"

networkinterface=`ip addr show | awk '/inet.*brd/{print $NF; exit}'`

sudo ip addr flush dev $networkinterface
sudo ip link set $networkinterface up
sudo ip link add name br0 type bridge

sleep 2

sudo ip link set $networkinterface master br0
sudo ip addr add 192.168.1.3/24 dev br0

sleep 2

sudo ip link set br0 up
sudo ip route add default via 192.168.1.1

sleep 2 

sudo ip tuntap add tap0 mode tap
sudo ip link set tap0 up
sudo ip link set tap0 master br0

sleep 2 

sudo brctl show

ip a

echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf >/dev/null
