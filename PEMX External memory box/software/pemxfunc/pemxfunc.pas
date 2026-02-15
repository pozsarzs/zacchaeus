{ +--------------------------------------------------------------------------+ }
{ | PEMX External memory box (EPROM bank)                                    | }
{ | Pozsar Zsolt <pozsarzs@gmail.com>, 2026. CC0 1.0 Universal               | }
{ | pemxfunc.pas                                                             | }
{ | Functions of the PEMX equipment for CP/M-80, v0.1                        | }
{ +--------------------------------------------------------------------------+ }
var
  ioaddr, bank, page: byte;
  memaddr: integer;

; --- DATA AREA ------------------------------------------------
BUAD:   DW      0               ; buffer start address
BUSI:   DW      2047            ; buffer size in byte - 1
EPAD:   DW      0               ; recent EPROM address (0..2047)
EPBI:   DB      0               ; selected EPROM bank index
EPPI:   DB      0               ; selected EPROM page index
IOAD:   DB      0               ; I/O port base address (Z80PIO)



{ SET I/O ADDRESS }
procedure setioaddr(address: byte);
begin
  ioaddr := address;
end;

{ GET I/O ADDRESS }
function getioaddr: byte;
begin
  getbase := ioaddr;
end;

{ SET BUFFER ADDRESS }
procedure setmemaddr(address: integer);
begin
  memaddr := address;
end;

{ READ DATA FROM EPROM TO BUFFER }
function readblock(bank, page: byte): byte;
begin
  inline(

    $05/            { _LO28:  DEC   B               ; if B = 0 }



        LD      A, H            ; H -> A
        LD      (EPBI), H       ; store EPROM bank index
        LD      A, L            ; L -> A
        LD      (EPPI), L       ; store EPROM page index

                                ; CHECK BANK AND PAGE INDEX
        LD      A, H            ; H -> A
        CP      08h             ; check value of the bank index (0..7)
        JP      NC, ERBI        ; if (EPBI) => 8 then goto label ERBI
        LD      A, L            ; H -> A
        CP      20h             ; check value of the page index (0..31)
        JP      NC, ERPI        ; if (EPPI) => 32 then goto label ERPI

                                ; ZEROIZE BUFFER AND VARIABLE(S)                        
        XOR     A               ; 0 -> A
        LD      HL, 0           ; 0 -> HL
        LD      (EPAD), HL      ; reset (EPAD) variable
        LD      HL, (BUAD)      ; buffer address -> HL
        LD      (HL), A         ; reset value of the (BUAD)
        LD      D, H            ; H -> D
        LD      E, L            ; L -> E
        INC     DE              ; increment DE
        LD      BC, (BUSI)      ; 2047 -> BC
        LDIR                    ; reset (BUAD)...(BUAD) + 2047 area

                                ; INITIALIZE Z80PIO
        LD      A, (IOAD)       ; i/o address -> A
        ADD     A, 2            ; A = A + 2 (Port A control register)
        LD      C, A            ; A -> C
        LD      A, 0Fh          ; set port A to output mode 
        OUT     (C), A          ; write control byte to PIO register
        IN      B, (C)          ; read control register to check PIO
        CP      B               ; compare input and output data
        JP      NZ, ERIO        ; if not equal goto label ERIO
        INC     C               ; A = A + 1 (Port B control register)
        LD      A, 4Fh          ; set port B to input mode 
        OUT     (C), A          ; write control byte to PIO resister

                                ; STORE EPROM BANK NUMBER
        LD      A, (EPBI)       ; EPROM bank number -> A
        AND     07h             ; A = 0000 0nnnb, nnn: 0..7 bank number
        OR      08h             ; A = 0000 1nnnb, bit3: enable demux (U9) output
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left, A = 1nnn 0000b
        OR      01h             ; A = 1nnn 0001b, bit0: select bank register (U5)
        CALL    RGWR            ; write data to register

LOOP:                           ; TOP OF THE READING LOOP

                                ; MAKE PHYSICAL ADDRESS
        LD      BC, (EPAD)      ; 0000 0aaa aaaa aaaab
        LD      A, (EPPI)       ; ???p ppppb
        AND     1Fh             ; 000p ppppb
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left, pppp p000b
        OR      B               ; pppp paaab (BC: pppp paaa aaaa aaaa)
        LD      B, A            ; A -> B

                                ; STORE LOW BYTE-LOW NIBBLE OF THE EPROM ADDRESS
        LD      A, C            ; A = nnnn nnnn
        AND     0Fh             ; A = 0000 nnnn b
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; A = nnnn 0000 b
        OR      02h             ; A = nnnn 0010 b
        CALL    RGWR

                                ; STORE LOW BYTE-HIGH NIBBLE OF THE EPROM ADDRESS
        LD      A, C            ; A = nnnn nnnn
        AND     0F0h            ; A = nnnn 0000 b
        OR      03h             ; A = nnnn 0011 b
        CALL    RGWR

                                ; STORE HIGH BYTE-LOW NIBBLE OF THE EPROM ADDRESS
        LD      A, B            ; A = nnnn nnnn
        AND     0Fh             ; A = 0000 nnnn b
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; rotate bits to left
        RLCA                    ; A = nnnn 0000 b
        OR      04h             ; A = nnnn 0100 b
        CALL    RGWR            ; write data to a register

                                ; STORE HIGH BYTE-HIGH NIBBLE OF THE EPROM ADDRESS
        LD      A, B            ; A = nnnn nnnn
        AND     0F0h            ; A = nnnn 0000 b
        OR      05h             ; A = nnnn 0101 b
        CALL    RGWR            ; 

                                ; READ A BYTE FROM EPROM,
        CALL    RGRD            ; A = byte from EPROM

                                ; STORE A BYTE
        LD      HL, (BUAD)      ; buffer address -> HL
        LD      DE, (EPAD)      ; offset -> DE
        ADD     HL, DE          ; HL = buffer address + offset
        LD      (HL), A         ; read byte -> (HL)

                                ; INCREMENT OFFSET
        INC     DE              ; increment DE
        LD      (EPAD), DE      ; incremented offset -> (EPAD)
        LD      HL, (EPAD)      ; (EPAD) -> HL
        LD      BC, 2048        ; 2048 -> BC
        OR      A               ; reset CF
        SBC     HL, BC          ; subtract 2048 from
        JP      C, LOOP         ; if HL < 2048 then goto loop label
                                ; BOTTOM OF THE READING LOOP

CLOSE:                          ; SET Z80PIO TO DEFAULT MODE
        LD      A, (IOAD)       ; i/o address -> A
        ADD     A, 2            ; A = A + 2 (Port A control register)
        LD      C, A            ; A -> C
        LD      A, 4Fh          ; set port A to input mode 
        OUT     (C), A          ; write control byte to PIO resister
        INC     C               ; A = A + 1 (Port B control register)
        LD      A, 4Fh          ; set port B to input mode 
        OUT     (C), A          ; write control byte to PIO resister
        XOR     A               ; reset A and CF
        JP      DONE

ERIO:                           ; NO Z80PIO ON THE SPECIFIED PORT
        LD      A, 01h          ; set return value to 1
        XOR     A               ; reset A and CF
        JP      DONE

ERBI:                           ; INVALID 'BANK' VALUE
        LD      A, 02h          ; set return value to 2
        XOR     A               ; reset A and CF
        JP      DONE

ERPI:                           ; INVALID 'PAGE' VALUE
        LD      A, 04h          ; set return value to 4
        XOR     A               ; reset A and CF

        JP      DONE            ; RETURN
        
RGWR:                           ; WRITE DATA TO ONE OF THE REGISTERS
        PUSH    BC              ; save BC registers
        PUSH    DE              ; save DE registers
        LD      D, (IOAD)       ; i/o address -> D
        LD      C, D            ; D -> C
        OR      8               ; set to 1 the CLK line, A = 1nnn 1001 b
        OUT     (C), A          ; write to port
        NOP                     ; waiting
        NOP                     ; waiting
        AND     0F7h            ; set to 0 the CLK line, A = 1nnn 0001 b
        OUT     (C), A          ; write to port
        POP     DE              ; restore DE register pair
        POP     BC              ; restore BC register pair
        RET

RGRD:                           ; READ DATA AND STORE IN THE BUFFER
        PUSH    BC              ; save BC register pair
        NOP                     ; waiting
        NOP                     ; waiting
        LD      C, (IOAD)       ; i/o address -> D
        INC     C               ; set B port address
        IN      A, (C)          ; read a byte   
        POP     BC              ; restore BC register pair
        RET

        END
  );
end;
