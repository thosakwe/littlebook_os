export CC=i686-elf-gcc
export NASM=NASM

.PHONY: all src

all: src

src:
	$(MAKE) -C src
