#! /bin/bash
set -e
. ./build.sh

mkdir -p iso
mkdir -p iso/boot
mkdir -p iso/boot/grub

cp sysroot/boot/snepos.kernel iso/boot/snepos.kernel
cat > iso/boot/grub/grub.cfg << EOF
menuentry "snepos" {
	multiboot /boot/snepos.kernel
}
EOF
grub-mkrescue -o snepos.iso iso
