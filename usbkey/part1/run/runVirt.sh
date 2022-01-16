#!/bin/bash

echo "Initialize Virtualization"

sudo modprobe kvm
sudo modprobe kvm-amd

sudo adduser `whoami` kvm
sudo chown root:`whoami` /dev/kvm
