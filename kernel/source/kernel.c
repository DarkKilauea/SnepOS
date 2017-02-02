#include <stdio.h>

#include <tty.h>

void kernel_main(void) {
	terminal_initialize();
	printf("Hello, kernel World!\n");
}
