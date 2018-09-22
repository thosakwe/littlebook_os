global loader ; This is the symbol we want GRUB to load...

; Multiboot stuff, of course.
MAGIC_NUMBER equ 0x1BADB00
FLAGS EQU 0X0 ; No flags
CHECKSUM equ -MAGIC_NUMBER
; (magic + checksum + flags) should equal 0.
; We have no flags, so the checksum should just
; be MAGIC - MAGIC = 0.

section .text
align 4 ; Code must be 4-byte aligned.
; I'm not really so sure why, but I assume that's
; the word boundary (32 bits) in real mode.
;
; Actually, I'm pretty sure that's the reason, lol.

dd MAGIC_NUMBER
dd FLAGS
dd CHECKSUM

; We have to actually emit the Multiboot header, mind you!

loader: ; Entry symbol
  mov eax, 0xCAFEBABE
  .loop:
    jmp .loop ; Hang forever
