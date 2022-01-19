#!/bin/bash

source ./qemu.cfg

echo "Launch Virtual Machine"

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:../host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/lib/:../host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/qemu-$QEVER/pc-bios/ \
    ../host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/qemu-$QEVER/build/qemu-system-x86_64 \
    -drive file=../../$PART/guest/$G_DISTRIB/$G_VERSION/$G_PROC/$APP/vd/$VDA.qcow2,format=qcow2,index=0,media=disk \
    -enable-kvm  -m $RAM \
    -display sdl,window-close=off \
    -device AC97 \
    -smp $CORE \
    -rtc base=localtime \
    -netdev tap,id=mynet0,ifname=tap0,script=no,downscript=no \
    -device e1000,netdev=mynet0,mac=52:55:00:d1:55:01 \
    -bios ../host/$H_DISTRIB/$H_VERSION/$H_PROC/qemu/$QEVER/qemu-$QEVER/pc-bios/bios-256k.bin 
