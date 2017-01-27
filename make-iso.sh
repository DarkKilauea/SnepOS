#!/bin/bash

mkdir -p isodir/boot/grub
cp bin/snepos.bin isodir/boot/snepos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o snepos.iso isodir
