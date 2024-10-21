[BITS 16]
[ORG 0x7C00]

start:
    mov ax, 0x3             ; Set video mode to 80x25 color text mode
    int 0x10                ; Video BIOS interrupt

    mov si, msg             ; Load the address of msg into SI
    call print_string       ; Call the print_string subroutine

    jmp $                   ; Infinite loop to stop CPU

print_string:
    mov ah, 0x0E            ; Function to print a character in TTY mode
next_char:
    lodsb                   ; Load string byte at SI into AL
    cmp al, 0               ; Check if char is null
    je done                 ; If zero, end of string
    int 0x10                ; BIOS call to print character
    jmp next_char
done:
    ret

msg db 'Hello World', 0    ; Define string with null terminator

times 510-($-$$) db 0       ; Pad the remainder of boot sector with zeros
dw 0xAA55                   ; Boot sector signature
