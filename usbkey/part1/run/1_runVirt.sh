#!/bin/bash

echo "Initialize Virtualization"

sudo modprobe kvm
sudo modprobe kvm-amd

sudo adduser `whoami` kvm
sudo chown root:`whoami` /dev/kvm
sudo chmod 666 /dev/kvm
