; 8.11 #1

INCLUDE Irvine32.inc

.data
array1 sdword 2, 1, 12, 3, -3, 4, 40, 5, -5, 77, 9
arraySize equ ($ - array1) / 4
largest sdword 0  ; Initialize largest to a very small number

.code
main PROC
    mov ecx, arraySize   ; Initialize loop counter
    mov esi, 0           ; Initialize array index

findLargest:
    mov eax, dword ptr [array1 + esi * 4] ; Load current element
    cmp eax, dword ptr [largest]           ; Compare with largest
    jle notLarger                         ; If not larger, skip
    mov dword ptr [largest], eax          ; Update largest
notLarger:
    inc esi                                ; Move to next element
    loop findLargest                       ; Continue loop

    ; At this point, the largest number is in [largest]

    mov eax, largest
    call WriteDec
    call Crlf

    ; Exit the program
    exit

main ENDP
END main
