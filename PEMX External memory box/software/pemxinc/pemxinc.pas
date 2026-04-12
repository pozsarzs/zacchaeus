{ +--------------------------------------------------------------------------+ }
{ | PEMX External memory box (EPROM bank)                                    | }
{ | Copyright (C) 2025-2026 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | pemxinc.pas                                                              | }
{ | Functions of the PEMX equipment, Z80, CP/M-80, v0.1                      | }
{ +--------------------------------------------------------------------------+ }

{ This program is free software: you can redistribute it and/or modify it
  under the terms of the European Union Public License 1.2 version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE. }

var
  buad: integer;        { buffer start address }
  busi: integer = 2047; { buffer size in byte - 1 }
  epad: integer;        { recent EPROM address (0..2047) }
  epbi: byte;           { selected EPROM bank index }
  eppi: byte;           { selected EPROM page index }
  ioad: byte;           { I/O port base address (Z80PIO) }

{ SET I/O ADDRESS }
procedure setioaddr(address: byte);
begin
  ioad := address;
end;

{ GET I/O ADDRESS }
function getioaddr: byte;
begin
  getioaddr := ioad;
end;

{ SET 2 KB BUFFER START ADDRESS }
procedure setmemaddr(address: integer);
begin
  buad := address;
end;

{ READ 2048 BYTE DATA (1 PAGE) FROM EPROM TO BUFFER }
function readblock(bank, page: byte): byte;
begin
  inline(
    $3A/(bank)/     {         LD      A, (bank)       ; (bank) -> A }
    $32/(epbi)/     {         LD      (EPBI), A       ; store EPROM bank index }
    $3A/(page)/     {         LD      A, (page)       ; (page) -> A }
    $32/(eppi)/     {         LD      (EPPI), A       ; store EPROM page index }

    { check bank and page index (16 byte) }
    $3A/(bank)/     {         LD      A, (bank)       ; (bank) -> A }
    $FE/$08/        {         CP      08h             ; check value of the bank index (0..7) }
    $D2/* + 181/    {         JP      NC, ERBI        ; if (EPBI) => 8 then goto label ERBI }
    $3A/(page)/     {         LD      A, (page)       ; (page) -> A }
    $FE/$20/        {         CP      20h	      ; check value of the page index (0..31) }
    $D2/* + 179/    {         JP      NC, ERPI        ; if (EPPI) => 32 then goto label ERPI }

    { zeroize buffer and variable(s) (20 byte) }
    $AF/            {         XOR     A               ; 0 -> A }
    $21/$00/$00/    {         LD      HL, 0           ; 0 -> HL }
    $22/(epad)/     {         LD      (EPAD), HL      ; reset (EPAD) variable }
    $2A/(buad)/     {         LD      HL, (BUAD)      ; buffer address -> HL }
    $77/            {         LD      (HL), A         ; reset value of the (BUAD) }
    $54/            {         LD      D, H            ; H -> D }
    $5D/            {         LD      E, L            ; L -> E }
    $13/            {         INC     DE              ; increment DE }
    $ED/$4B/(busi)/ {         LD      BC, (BUSI)      ; 2047 -> BC }
    $ED/$B0/        {         LDIR                    ; reset (BUAD)...(BUAD) + 2047 area }

    { initialize z80pio (25 byte) }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address  lower byte -> A }
    $C6/$02/        {         ADD     A, 2            ; A = A + 2 (Port A control register) }
    $4F/            {         LD      C, A            ; A -> C }
    $3E/$0F/        {         LD      A, 0Fh          ; set port A to output mode }
    $06/$00/        {         LD      B, 0            ; zeroize i/o address upper byte }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO register }
    $ED/$40/        {         IN      B, (C)          ; read control register to check PIO }
    $B8/            {         CP      B               ; compare input and output data }
    $C2/* + 120/    {         JP      NZ, ERIO        ; if not equal goto label ERIO }
    $0C/            {         INC     C               ; A = A + 1 (Port B control register) }
    $3E/$4F/        {         LD      A, 4Fh          ; set port B to input mode }
    $06/$00/        {         LD      B, 0            ; zeroize i/o address upper byte }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO resister }

    { store EPROM bank number (16 byte) }
    $3A/(epbi)/     {         LD      A, (EPBI)       ; EPROM bank number -> A }
    $E6/$07/        {         AND     07h             ; A = 0000 0nnnb, nnn: 0..7 bank number }
    $F6/$08/        {         OR      08h             ; A = 0000 1nnnb, bit3: enable demux (U9) output }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left, A = 1nnn 0000b }
    $F6/$01/        {         OR      01h             ; A = 1nnn 0001b, bit0: select bank register (U5) }
    $CD/* + 124/    {         CALL    RGWR            ; write data to register }

    { TOP OF THE READING LOOP }

    { make physical address (14 byte) }
    $ED/$4B/(epad)/ { LOOP:   LD      BC, (EPAD)      ; 0000 0aaa aaaa aaaab }
    $3A/(eppi)/     {         LD      A, (EPPI)       ; ???p ppppb }
    $E6/$1F/        {         AND     1Fh             ; 000p ppppb }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left, pppp p000b }
    $B0/            {         OR      B               ; pppp paaab (BC: pppp paaa aaaa aaaa) }
    $47/            {         LD      B, A            ; A -> B }

    { store low byte-low nibble of the EPROM address (12 byte) }
    $79/            {         LD      A, C            ; A = nnnn nnnn }
    $E6/$0F/        {         AND     0Fh             ; A = 0000 nnnn b }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; A = nnnn 0000 b }
    $F6/$02/        {         OR      02h             ; A = nnnn 0010 b }
    $CD/* + 98/     {         CALL    RGWR }

    { store low byte-high nibble of the EPROM address (8 byte) }
    $79/            {         LD      A, C            ; A = nnnn nnnn }
    $E6/$F0/        {         AND     0F0h            ; A = nnnn 0000 b }
    $F6/$03/        {         OR      03h             ; A = nnnn 0011 b }
    $CD/* + 90/     {         CALL    RGWR }

    { store high byte-low nibble of the EPROM address (12 byte) }
    $78/            {         LD      A, B            ; A = nnnn nnnn }
    $E6/$0F/        {         AND     0Fh             ; A = 0000 nnnn b }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; A = nnnn 0000 b }
    $F6/$04/        {         OR      04h             ; A = nnnn 0100 b }
    $CD/* + 78/     {         CALL    RGWR            ; write data to a register }

    { store high byte-high nibble of the EPROM address (8 byte) }
    $78/            {         LD      A, B            ; A = nnnn nnnn }
    $E6/$F0/        {         AND     0F0h            ; A = nnnn 0000 b }
    $F6/$05/        {         OR      05h             ; A = nnnn 0101 b }
    $CD/* + 70/     {         CALL    RGWR            ; write data to a register }

    { read a byte from EPROM (3 byte) }
    $CD/* + 90/     {         CALL    RGRD            ; A = byte from EPROM }

    { store a byte (9 byte) }
    $2A/(buad)/     {         LD      HL, (BUAD)      ; buffer address -> HL }
    $ED/$5B/(epad)/ {         LD      DE, (EPAD)      ; offset -> DE }
    $19/            {         ADD     HL, DE          ; HL = buffer address + offset }
    $77/            {         LD      (HL), A         ; read byte -> (HL) }

    { increment offset (17 byte) }
    $13/            {         INC     DE              ; increment DE }
    $ED/$53/(epad)/ {         LD      (EPAD), DE      ; incremented offset -> (EPAD) }
    $2A/(epad)/     {         LD      HL, (EPAD)      ; (EPAD) -> HL }
    $01/$00/$08/    {         LD      BC, 2048        ; 2048 -> BC }
    $B7/            {         OR      A               ; reset CF }
    $ED/$42/        {         SBC     HL, BC          ; subtract 2048 from }
    $DA/* -81/      {         JP      C, LOOP         ; if HL < 2048 then goto loop label }

    { BOTTOM OF THE READING LOOP }

    { set z80pio to default mode (21 byte) }
    $3A/(ioad)/     { CLOSE:  LD      A, (IOAD)       ; i/o address lower byte -> A }
    $C6/$02/        {         ADD     A, 2            ; A = A + 2 (Port A control register) }
    $4F/            {         LD      C, A            ; A -> C }
    $3E/$4F/        {         LD      A, 4Fh          ; set port A to input mode }
    $06/$00/        {         LD      B, 0            ; zeroize i/o address upper byte }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO resister }
    $0C/            {         INC     C               ; A = A + 1 (Port B control register) }
    $3E/$4F/        {         LD      A, 4Fh          ; set port B to input mode }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO resister }
    $AF/            {         XOR     A               ; reset A and CF }
    $C3/* + 57/     {         JP      DONE            ; return }

    { no z80pio on the specifibanked port (6 byte) }
    $AF/            { ERIO:   XOR     A               ; reset A and CF }
    $3E/$01/        {         LD      A, 01h          ; set return value to 1 }
    $C3/* + 51/     {         JP      DONE            ; return }

    { invalid 'bank' value (6 byte) }
    $AF/            { ERBI:   XOR     A               ; reset A and CF }
    $3E/$02/        {         LD      A, 02h          ; set return value to 2 }
    $C3/* + 45/     {         JP      DONE            ; return }

    { invalid 'page' value (6 byte) }
    $AF/            { ERPI:   XOR     A               ; reset A and CF }
    $3E/$04/        {         LD      A, 04h          ; set return value to 4 }
    $C3/* + 39/     {         JP      DONE            ; return }
        
    { write data to one of the registers (23 byte) }
    $C5/            { RGWR:   PUSH    BC              ; save BC register pair }
    $D5/            {         PUSH    DE              ; save DE registers }
    $47/            {         LD      B, A            ; A -> B }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address lower byte -> A }
    $4F/            {         LD      C, A            ; A -> C }
    $78/            {         LD      A, B            ; B -> A }
    $F6/$08/        {         OR      8               ; set to 1 the CLK line, A = 1nnn 1001 b }
    $06/$00/        {         LD      B, 0            ; zeroize i/o address upper byte }
    $ED/$79/        {         OUT     (C), A          ; write to port }
    $00/            {         NOP                     ; waiting }
    $00/            {         NOP                     ; waiting }
    $E6/$F7/        {         AND     0F7h            ; set to 0 the CLK line, A = 1nnn 0001 b }
    $ED/$79/        {         OUT     (C), A          ; write to port }
    $D1/            {         POP     DE              ; restore DE register pair }
    $C1/            {         POP     BC              ; restore BC register pair }
    $C9/            {         RET }

    { read data and store in the buffer (14 byte) }
    $C5/            { RGRD:   PUSH    BC              ; save BC register pair }
    $00/            {         NOP                     ; waiting }
    $00/            {         NOP                     ; waiting }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address lower byte -> A }
    $4F/            {         LD      C, A            ; A -> C }
    $0C/            {         INC     C               ; set B port address }
    $06/$00/        {         LD      B, 0            ; zeroize i/o address upper byte }
    $ED/$78/        {         IN      A, (C)          ; read a byte }
    $C1/            {         POP     BC              ; restore BC register pair }
    $C9             {         RET }

    { exit from function }
    $32/(readblock)/{ DONE:   LD (readblock), A       ; set result }
  );
end;
