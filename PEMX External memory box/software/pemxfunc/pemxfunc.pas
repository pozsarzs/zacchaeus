{ +--------------------------------------------------------------------------+ }
{ | PEMX External memory box (EPROM bank)                                    | }
{ | Copyright (C) 2025-2026 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | pemxfunc.pas                                                             | }
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
  getbase := ioad;
end;

{ SET BUFFER ADDRESS }
procedure setmemaddr(address: integer);
begin
  buad := address;
end;

{ 
; -- Read 2048 byte data (1 page) from EPROM to buffer ----
; Input:     H = EPROM bank number (0-7h)
;            L = EPROM page index  (0-1Fh)
; Output:    A = 0, Carry = 0: no error
;            A = 1, Carry = 0: no Z80PIO on the specified port
;            A = 4, Carry = 0: invalid 'bank' value
;            A = 8, Carry = 0: invalid 'page' value
 }

{ READ DATA FROM EPROM TO BUFFER }
function readblock(bank, page: byte): byte;
begin
  inline(
    $3A/(bank)/     { F10:    LD    A, (bank)         ; (bank) -> A }
        LD      (EPBI), (bank)  ; store EPROM bank index
        LD      A, (page)       ; L -> A
        LD      (EPPI), (page)  ; store EPROM page index

                    {                                 ; CHECK BANK AND PAGE INDEX }
        LD      A, (bank)       ; H -> A
    $FE/$08/        {         CP      08h             ; check value of the bank index (0..7) }
        JP      NC, ERBI        ; if (EPBI) => 8 then goto label ERBI
        LD      A, (page)       ; H -> A
    $FE/$20/        {         CP      20h             ; check value of the page index (0..31) }
        JP      NC, ERPI        ; if (EPPI) => 32 then goto label ERPI

                    {                                 ; ZEROIZE BUFFER AND VARIABLE(S) }
    $AF/            {         XOR     A               ; 0 -> A }
    $21/$00/$00/    {         LD      HL, 0           ; 0 -> HL }
    $22/(epad)/     {         LD      (EPAD), HL      ; reset (EPAD) variable }
    $2A/(buad)/     {         LD      HL, (BUAD)      ; buffer address -> HL }
    $77/            {         LD      (HL), A         ; reset value of the (BUAD) }
    $54/            {         LD      D, H            ; H -> D }
    $5D             {         LD      E, L            ; L -> E }
    $13/            {         INC     DE              ; increment DE }
    $ED/$48/(busi)/ {         LD      BC, (BUSI)      ; 2047 -> BC }
    $ED/$B0/        {         LDIR                    ; reset (BUAD)...(BUAD) + 2047 area }

                    {                                 ; INITIALIZE Z80PIO }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address -> A }
    $C6/$02/        {         ADD     A, 2            ; A = A + 2 (Port A control register) }
    $4F/            {         LD      C, A            ; A -> C }
    $3E/$0F/        {         LD      A, 0Fh          ; set port A to output mode }
    $06/$00/        {         LD      B, 0            ; 0 -> B }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO register }
    $ED/$40/        {         IN      B, (C)          ; read control register to check PIO }
    $B8/            {         CP      B               ; compare input and output data }
    $C2/ERIO!/      {         JP      NZ, ERIO        ; if not equal goto label ERIO }
    $0C/            {         INC     C               ; A = A + 1 (Port B control register) }
    $3E/$4F/        {         LD      A, 4Fh          ; set port B to input mode }
    $06/$00/        {         LD      B, 0            ; 0 -> B }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO resister }

                    {                                 ; STORE EPROM BANK NUMBER }
    $3A/(epbi)/     {         LD      A, (EPBI)       ; EPROM bank number -> A }
    $E6/$07/        {         AND     07h             ; A = 0000 0nnnb, nnn: 0..7 bank number }
    $F6/$08/        {         OR      08h             ; A = 0000 1nnnb, bit3: enable demux (U9) output }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left, A = 1nnn 0000b }
    $F6/$01/        {         OR      01h             ; A = 1nnn 0001b, bit0: select bank register (U5) }
    $CD/lo/hi/      {         CALL    RGWR            ; write data to register }

                    { LOOP:                           ; TOP OF THE READING LOOP }

                    {                                 ; MAKE PHYSICAL ADDRESS }
    $ED/$48/(epad)/ {         LD      BC, (EPAD)      ; 0000 0aaa aaaa aaaab }
    $3A/(eppi)/     {         LD      A, (EPPI)       ; ???p ppppb }
    $E6/$1F/        {         AND     1Fh             ; 000p ppppb }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left, pppp p000b }
    $B0/            {         OR      B               ; pppp paaab (BC: pppp paaa aaaa aaaa) }
    $47/            {         LD      B, A            ; A -> B }

                    {                                 ; STORE LOW BYTE-LOW NIBBLE OF THE EPROM ADDRESS }
    $79/            {         LD      A, C            ; A = nnnn nnnn }
    $E6/$0F/        {         AND     0Fh             ; A = 0000 nnnn b }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; A = nnnn 0000 b }
    $F6/$02/        {         OR      02h             ; A = nnnn 0010 b }
    $CD/RGWR!/      {         CALL    RGWR }

                    {                                 ; STORE LOW BYTE-HIGH NIBBLE OF THE EPROM ADDRESS }
    $79/            {         LD      A, C            ; A = nnnn nnnn }
    $E6/$F0/        {         AND     0F0h            ; A = nnnn 0000 b }
    $F6/$03/        {         OR      03h             ; A = nnnn 0011 b }
    $CD/RGWR!/      {         CALL    RGWR }

                    {                                 ; STORE HIGH BYTE-LOW NIBBLE OF THE EPROM ADDRESS }
    $78/            {         LD      A, B            ; A = nnnn nnnn }
    $E6/$0F/        {         AND     0Fh             ; A = 0000 nnnn b }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; rotate bits to left }
    $07/            {         RLCA                    ; A = nnnn 0000 b }
    $F6/$04/        {         OR      04h             ; A = nnnn 0100 b }
    $CD/RGWR!/      {         CALL    RGWR            ; write data to a register }

                    {                                 ; STORE HIGH BYTE-HIGH NIBBLE OF THE EPROM ADDRESS }
    $78/            {         LD      A, B            ; A = nnnn nnnn }
    $E6/$F0/        {         AND     0F0h            ; A = nnnn 0000 b }
    $F6/$05/        {         OR      05h             ; A = nnnn 0101 b }
    $CD/RGWR!/      {         CALL    RGWR            ; write data to a register }

                    {                                 ; READ A BYTE FROM EPROM }
    $CD/RGRD!/      {         CALL    RGRD            ; A = byte from EPROM }

                    {                                 ; STORE A BYTE }
    $2A/(buad)/     {         LD      HL, (BUAD)      ; buffer address -> HL }
    $ED/5B/(epad)/  {         LD      DE, (EPAD)      ; offset -> DE }
    $19/            {         ADD     HL, DE          ; HL = buffer address + offset }
    $77/            {         LD      (HL), A         ; read byte -> (HL) }

                    {                                 ; INCREMENT OFFSET }
    $13/            {         INC     DE              ; increment DE }
    $ED/$53/(epad)  {         LD      (EPAD), DE      ; incremented offset -> (EPAD) }
    $2A/(epad)      {         LD      HL, (EPAD)      ; (EPAD) -> HL }
    $01/$00/$08/    {         LD      BC, 2048        ; 2048 -> BC }
    $B7/            {         OR      A               ; reset CF }
    $ED/$42/        {         SBC     HL, BC          ; subtract 2048 from }
    $DA/LOOP!/      {         JP      C, LOOP         ; if HL < 2048 then goto loop label }
                    {                                 ; BOTTOM OF THE READING LOOP }

                    { CLOSE:                          ; SET Z80PIO TO DEFAULT MODE }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address -> A }
    $C6/$02/        {         ADD     A, 2            ; A = A + 2 (Port A control register) }
    $4F/            {         LD      C, A            ; A -> C }
    $3E/$4F/        {         LD      A, 4Fh          ; set port A to input mode }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO resister }
    $0C/            {         INC     C               ; A = A + 1 (Port B control register) }
    $3E/$4F/        {         LD      A, 4Fh          ; set port B to input mode }
    $ED/$79/        {         OUT     (C), A          ; write control byte to PIO resister }
    $AF/            {         XOR     A               ; reset A and CF }
    $C3/DONE!/      {         JP      DONE            ; RETURN }

                    { ERIO:                           ; NO Z80PIO ON THE SPECIFIED PORT }
    $3E/$01/        {         LD      A, 01h          ; set return value to 1 }
    $AF/            {         XOR     A               ; reset A and CF }
    $C3/DONE!/      {         JP      DONE            ; RETURN }

                    { ERBI:                           ; INVALID 'BANK' VALUE }
    $3E/$02/        {         LD      A, 02h          ; set return value to 2 }
    $AF/            {         XOR     A               ; reset A and CF }
    $C3/DONE!/      {         JP      DONE            ; RETURN }

                    { ERPI:                           ; INVALID 'PAGE' VALUE }
    $3E/$04/        {         LD      A, 04h          ; set return value to 4 }
    $AF/            {         XOR     A               ; reset A and CF }
    $C3/DONE!/      {         JP      DONE            ; RETURN }
        
                    { RGWR:                           ; WRITE DATA TO ONE OF THE REGISTERS }
    $C5/            {         PUSH    BC              ; save BC register pair }
    $D5/            {         PUSH    DE              ; save DE registers }
    $47/            {         LD      B, A            ; A -> B }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address -> A }
    $4F/            {         LD      C, A            ; A -> C }
    $78/            {         LD      A, B            ; B -> A }
    $06/$00/        {         LD      B, 0            ; 0 -> B }
    $F6/$08/        {         OR      8               ; set to 1 the CLK line, A = 1nnn 1001 b }
    $ED/$79/        {         OUT     (C), A          ; write to port }
    $00/            {         NOP                     ; waiting }
    $00/            {         NOP                     ; waiting }
    $E6/$F7/        {         AND     0F7h            ; set to 0 the CLK line, A = 1nnn 0001 b }
    $ED/$79/        {         OUT     (C), A          ; write to port }
    $D1/            {         POP     DE              ; restore DE register pair }
    $C1/            {         POP     BC              ; restore BC register pair }
    $C9             {         RET }

                    { RGRD:                           ; READ DATA AND STORE IN THE BUFFER }
    $C5/            {         PUSH    BC              ; save BC register pair }
    $00/            {         NOP                     ; waiting }
    $00/            {         NOP                     ; waiting }
    $06/$00/        {         LD      B, 0            ; 0 -> B }
    $3A/(ioad)/     {         LD      A, (IOAD)       ; i/o address -> A }
    $4F/            {         LD      C, A            ; A -> C }
    $0C/            {         INC     C               ; set B port address }
    $ED/$78/        {         IN      A, (C)          ; read a byte }
    $C1/            {         POP     BC              ; restore BC register pair }
    $C9             {         RET }
  );
end;
