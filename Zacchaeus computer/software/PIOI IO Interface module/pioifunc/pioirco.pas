{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus * PIOI interface module                                        | }
{ | Copyright (C) 2025 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | pioifunc.pas                                                             | }
{ | Functions of the PIOI interface for CP/M-80                              | }
{ +--------------------------------------------------------------------------+ }

{ WRITE DATA TO ALL RCOS }
{ Global or specified data in registers:
    C: address
    D: data }
procedure writerco(data: byte);
begin
  inline(
    { initial value(s) }
    $3A/data/       {         LD    A, (DATA)       ; data -> A }
    $A3/$F0/        {         AND   0F0h            ; mask output data }
    $57/            {         LD    D, A            ; masked output data -> D }

    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/$0F/        {         AND   0Fh             ; mask previous output data }
    $B2/            {         OR    D               ; merge bytes }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write output data to port }
  );
end;

{ MASKED WRITE DATA TO ALL RCOS }
{ Global or specified data in registers:
    C: address
    D: data
    E: mask }
procedure maskwriterco (data, mask: byte);
begin
  inline(
    { initial value(s) }
    $3A/data/       {         LD    A, (DATA)       ; retrieve data }
    $57/            {         LD    D, A            ; A -> D }
    $3A/mask/       {         LD    A, (MASK)       ; retrieve mask }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $7B/            {         LD    A, E            ; E -> A }
    $A3/$0F/        {         AND   0Fh             ; mask the mask }      
    $CB/$27/        {         SLA   A               ; shift left }
    $CB/$27/        {         SLA   A               ; shift left }
    $CB/$27/        {         SLA   A               ; shift left }
    $CB/$27/        {         SLA   A               ; shift left }
    $5F/            {         LD    E, A            ; A -> E }

    $7A/            {         LD    A, D            ; D -> A }
    $CB/$27/        {         SLA   A               ; shift left }
    $CB/$27/        {         SLA   A               ; shift left }
    $CB/$27/        {         SLA   A               ; shift left }
    $CB/$27/        {         SLA   A               ; shift left }
    $A3/$0F/        {         AND   0Fh             ; mask output data }
    $A3/            {         AND   E               ; mask output data }
    $57/            {         LD    D, A            ; masked output data -> D }
      
    $7B/            {         LD    A, E            ; E -> A }
    $EE/$FF/        {         XOR   0FFh            ; invert mask }
    $F6/$0F/        {         OR    0Fh             ; set low bits to 1 }
    $5F/            {         LD    E, A            ; A -> E }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; mask previous output data }
    $B2/            {         OR    D               ; merge bytes }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write out data }
  );
end;

{ SWITCH ON A RCO PORT }
{ Global or specified data in registers:
    C: address
    E: port number }
procedure onrco(portnum: byte);
begin
  inline(
    { initial value(s) }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; retrieve port number }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$01/        {         LD    A, 1            ; starting place value }
    $43/            {         LD    B, E            ; E -> B, shift counter }
    $04/            {         INC   B               ; correction }
    
    $05/            { _LO38:  DEC   B               ; if B = 0 }
    $28/4/          {         JR    Z, _DO38        ; - the goto _DO38 label }
    $CB/$27/        {         SLA   A               ; - else shift to left }
    $18/-7/         {         JR    _LO38           ;   goto _LO38 label }

    $07/            { _DO38:  RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $57/            {         LD    D, A            ; A -> D }

    $EE/$FF/        {         XOR   0FFh            ; invert place value }
    $F6/$0F/        {         OR    0Fh             ; protect lower 4 bits }
    $5F/            {         LD    E, A            ; A -> E (byte punch mask) }

    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write out data }
  );
end;

{ SWITCH OFF A RCO PORT }
{ Global or specified data in registers:
    C: address
    E: port number }
procedure offrco(portnum: byte);
begin
  inline(
    { initial value(s) }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; retrieve port number }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$01/        {         LD    A, 1            ; starting place value }
    $43/            {         LD    B, E            ; E -> B, shift counter }
    $04/            {         INC   B               ; correction }

    $05/            { _LO39:  DEC   B               ; if B = 0 }
    $28/4/          {         JR    Z, _DO39        ; - the goto _DO39 label }
    $CB/$27/        {         SLA   A               ; - else shift to left }
    $18/-7/         {         JR    _LO39           ;   goto _LO39 label }

    $07/            { _DO39:  RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $57/            {         LD    D, A            ; A -> D }

    $EE/$FF/        {         XOR   0FFh            ; invert place value }
    $F6/$0F/        {         OR    0Fh             ; protect lower 4 bits }
    $5F/            {         LD    E, A            ; A -> E (byte punch mask) }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; punch specified place }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write out data }
  );
end;

{ SWITCH ON AND DELAYED OFF A RCO PORT }
{ Global or specified data in registers:
    C: address
    D: relative delay
    E: port number }
procedure pulserco(delay, portnum: byte);
begin
  inline(
    { initial data }
    $3A/delay/      {         LD    A, (DELAY)      ; retrieve delay }
    $57/            {         LD    D, A            ; A -> D }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; retrieve port number }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$01/        {         LD    A, 1            ; starting place value }
    $43/            {         LD    B, E            ; E -> B, shift counter }
    $04/            {         INC   B               ; correction }

    $05/            { _LO3A:  DEC   B               ; if B = 0 }
    $28/4/          {         JR    Z, _DO3A        ; - the goto _DO3A label }
    $CB/$27/        {         SLA   A               ; - else shift to left }
    $18/-7/         {         JR    _LO3A           ;   goto _LO3A label }

    $07/            { _DO3A:  RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $07/            {         RLCA                  ; shift: D0-D3 -> D4-D7 }
    $67/            {         LD    H, A            ; A -> H }

    $EE/$FF/        {         XOR   0FFh            ; invert place value }
    $F6/$0F/        {         OR    0Fh             ; protect lower 4 bits }
    $5F/            {         LD    E, A            ; A -> E (byte punch mask) }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; punch specified place ) }
    $B4/            {         OR    H               ; put 1 to hole }
    $ED/$79/        {         OUT   (C), A          ; write out data }

    $E5/            {         PUSH  HL              ; save registers }
    $21/$00/$40/    { _OL3A:  LD    HL, 4000h       ; inner loop counter }
    $00/            { _IL3A:  NOP                   ; waste of time }
    $2B/            {         DEC   HL              ; decrement counter }
    $7C/            {         LD    A, H            ; H -> A }
    $B5/            {         OR    L               ; if H OR L = 0 -> Z = 1 }
    $C2/*-5/        {         JP    NZ, _IL3A       ; end of the inner loop }
    $15/            {         DEC   D               ; decrement relative delay value }
    $C2/*-12/       {         JP    NZ, _OL3A       ; end of the outer loop }
    $E1/            {         POP   HL              ; restore registers }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $ED/$79/        {         OUT   (C), A          ; write out data }
  );
end;
