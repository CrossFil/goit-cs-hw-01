org  0x100               ; Specifies this is a .COM program
section .data
    a db 5               ; Define a = 5
    b db 3               ; Define b = 3
    c db 2               ; Define c = 2
    resultMsg db 'Result: $' ; Define message for result display

section .text
_start:
    mov al, [b]          ; Load b into al
    sub al, [c]          ; Subtract c from al
    add al, [a]          ; Add a to al

    ; Convert the result to an ASCII character (for single-digit numbers)
    add al, 30h          ; Convert number to ASCII character

    ; Display the result
    mov ah, 09h          ; DOS function to display a string
    lea dx, resultMsg    ; Load address of resultMsg into dx
    int 21h              ; DOS interrupt to display string

    ; Display the result number
    mov dl, al           ; Move the result into dl for output
    mov ah, 02h          ; DOS function to display a character
    int 21h              ; DOS interrupt to display character

    ; Exit program
    mov ax, 4c00h        ; DOS function to terminate program
    int 21h              ; DOS interrupt to terminate program
