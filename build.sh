#!/bin/bash

# make temporary directories
mkdir -p obj
mkdir -p bin

# Assemble bootstrap
i686-elf-as boot.s -o obj/boot.o

# Compile kernel
i686-elf-gcc -c kernel.c -o obj/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

# Link bootstrapper and kernel together
i686-elf-gcc -T linker.ld -o bin/snepos.bin -ffreestanding -O2 -nostdlib obj/boot.o obj/kernel.o -lgcc
