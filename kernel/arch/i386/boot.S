#define ASM_FILE 1
#include <multiboot.h>

# Declare constants for the multiboot header.
# Multiboot 'flags'
.set FLAGS, MULTIBOOT_PAGE_ALIGN | MULTIBOOT_MEMORY_INFO
# 'magic number' lets bootloader find the header
.set MAGIC, MULTIBOOT_HEADER_MAGIC
# checksum of above, to prove we are multiboot
.set CHECKSUM, -(MAGIC + FLAGS)

# Declare a header as in the Multiboot Standard.
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

# Reserve a stack for the initial thread.
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

# The kernel entry point.
.section .text
.global _start
.type _start, @function
_start:
	movl $stack_top, %esp

	# Push multiboot information structure
	pushl %ebx

	# Push multiboot magic number
	pushl %eax

	# Call the global constructors.
	call _init

	# Transfer control to the main kernel.
	call kernel_main

	# Hang if kernel_main unexpectedly returns.
	cli
panic_loop:	
	hlt
	jmp panic_loop
.size _start, . - _start
