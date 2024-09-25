CC = gcc
AS = nasm
LD = ld
CFLAGS = -m64 -ffreestanding -Wall -Wextra
LDFLAGS = -m elf_x86_64 -T linker.ld

# Répertoires
SRC_DIR = kernel
BOOT_DIR = boot
INC_DIR = include

# Fichiers sources
KERNEL_SRC = $(wildcard $(SRC_DIR)/*.c)
BOOT_SRC = $(BOOT_DIR)/boot.asm

# Fichiers objets
KERNEL_OBJS = $(KERNEL_SRC:.c=.o)
BOOT_OBJ = boot.o

# Fichiers finaux
KERNEL_BIN = kernel.bin
ISO = kernel.iso

all: $(ISO)

$(KERNEL_BIN): $(KERNEL_OBJS)
	$(LD) $(LDFLAGS) -o $(KERNEL_BIN) $(KERNEL_OBJS)

$(BOOT_OBJ): $(BOOT_SRC)
	$(AS) -f elf64 $(BOOT_SRC) -o $(BOOT_OBJ)

$(ISO): $(BOOT_OBJ) $(KERNEL_BIN)
	mkdir -p iso/boot/grub
	cp $(KERNEL_BIN) iso/boot/kernel.bin
	cp boot/grub.cfg iso/boot/grub/
	grub-mkrescue -o $(ISO) iso/

clean:
	rm -rf $(KERNEL_OBJS) $(BOOT_OBJ) $(KERNEL_BIN) iso $(ISO)

.PHONY: all clean
