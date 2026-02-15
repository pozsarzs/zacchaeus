{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus Microcomputer                                                  | }
{ | Pozsar Zsolt <pozsarzs@gmail.com>, 2026. CC0 1.0 Universal               | }
{ | pioifoco.pas                                                             | }
{ | OCO functions                                                            | }
{ +--------------------------------------------------------------------------+ }

{ WRITE DATA TO ALL OCOS }
procedure writeoco(data: byte);
begin
  inline(
    { initial value(s) }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/data/       {         LD    A, (data)       ; data -> A }
    $E6/$0F/        {         AND   0Fh             ; mask output data }
    $57/            {         LD    D, A            ; masked output data -> D }

    $3A/datout/     {         LD    A, (datout)     ; retrieve previous output data }
    $E6/$F0/        {         AND   0F0h            ; mask previous output data }
    $B2/            {         OR    D               ; merge bytes }

    $32/datout/     {         LD    (datout), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write output data to port }
  );
end;

{ MASKED WRITE DATA TO ALL OCOS }
procedure maskwriteoco (data, mask: byte);
begin
  inline(
    { initial value(s) }
    $3A/data/       {         LD    A, (DATA)       ; retrieve data }
    $57/            {         LD    D, A            ; A -> D }
    $3A/mask/       {         LD    A, (MASK)       ; retrieve mask }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $7B/            {         LD    A, E            ; E -> A }
    $E6/$0F/        {         AND   0Fh             ; mask the mask }
    $5F/            {         LD    E, A            ; A -> E }

    $7A/            {         LD    A, D            ; D -> A }
    $E6/$0F/        {         AND   0Fh             ; mask output data }
    $A3/            {         AND   E               ; mask output data }
    $57/            {         LD    D, A            ; masked output data -> D }

    $7B/            {         LD    A, E            ; E -> A }
    $EE/$FF/        {         XOR   0FFh            ; invert mask }
    $F6/$F0/        {         OR    0F0h            ; protect high 4 bits }
    $5F/            {         LD    E, A            ; A -> E }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; mask previous output data }
    $B2/            {         OR    D               ; merge bytes }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write out data }
  );
end;

{ SWITCH ON A OCO PORT }
procedure onoco(portnum: byte);
begin
  inline(
    { initial value(s) }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; retrieve port number }
    $5F/            {         LD    E, A            ; A -> E }

    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$01/        {         LD    A, 1            ; starting place value }
    $43/            {         LD    B, E            ; E -> B, shift counter }
    $04/            {         INC   B               ; correction }

    $05/            { _LO28:  DEC   B               ; if B = 0 }
    $28/4/          {         JR    Z, _DO28        ; - the goto _DO28 label }
    $CB/$27/        {         SLA   A               ; - else shift to left }
    $18/-7/         {         JR    _LO28           ;   goto _LO28 label }

    $E6/$0F/        { _DO28:  AND   0Fh             ; mask the place value }
    $57/            {         LD    D, A            ; A -> D }

    $EE/$FF/        {         XOR   0FFh            ; invert place value }
    $F6/$F0/        {         OR    0F0h            ; protect upper 4 bits }
    $5F/            {         LD    E, A            ; A -> E (byte punch mask) }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; punch specified place }
    $B2/            {         OR    D               ; put 1 to hole }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write out data }
  );
end;

{ SWITCH OFF A OCO PORT }
procedure offoco(portnum: byte);
begin
  inline(
    { initial value(s) }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; retrieve port number }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$01/        {         LD    A, 1            ; starting place value }
    $43/            {         LD    B, E            ; E -> B, shift counter }
    $04/            {         INC   B               ; correction }

    $05/            { _LO29:  DEC   B               ; if B = 0 }
    $28/4/          {         JR    Z, _DO29        ; - the goto _DO29 label }
    $CB/$27/        {         SLA   A               ; - else shift to left }
    $18/-7/         {         JR    _LO29           ;   goto _LO29 label }

    $E6/$0F/        { _DO29:  AND   0Fh             ; mask the place value }
    $57/            {         LD    D, A            ; A -> D }

    $EE/$FF/        {         XOR   0FFh            ; invert place value }
    $F6/$F0/        {         OR    0F0h            ; protect upper 4 bits }
    $5F/            {         LD    E, A            ; A -> E (byte punch mask) }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; punch specified place }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write out data }
  );
end;

{ SWITCH ON AND DELAYED OFF A OCO PORT }
procedure pulseoco(delay, portnum: byte);
begin
  inline(
    { initial value(s) }
    $3A/delay/      {         LD    A, (DELAY)      ; retrieve delay }
    $57/            {         LD    D, A            ; A -> D }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; retrieve port number }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$01/        {         LD    A, 1            ; starting place value }
    $43/            {         LD    B, E            ; E -> B, shift counter }
    $04/            {         INC   B               ; correction }

    $05/            { _LO2A:  DEC   B               ; if B = 0 }
    $28/4/          {         JR    Z, _DO2A        ; - the goto _DO2A label }
    $CB/$27/        {         SLA   A               ; - else shift to left }
    $18/-7/         {         JR    _LO2A           ;   goto _LO2A label }

    $E6/$0F/        { _DO2A:  AND   0Fh             ; mask the place value }
    $67/            {         LD    H, A            ; A -> H }

    $EE/$FF/        {         XOR   0FFh            ; invert place value }
    $F6/$F0/        {         OR    0F0h            ; protect upper 4 bits }
    $5F/            {         LD    E, A            ; A -> E (byte punch mask) }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $A3/            {         AND   E               ; punch specified place ) }
    $B4/            {         OR    H               ; put 1 to hole }
    $ED/$79/        {         OUT   (C), A          ; write out data }

    $E5/            {         PUSH  HL              ; save registers }
    $21/$00/$40/    { _OL2A:  LD    HL, 4000h       ; inner loop counter }
    $00/            { _IL2A:  NOP                   ; waste of time }
    $2B/            {         DEC   HL              ; decrement counter }
    $7C/            {         LD    A, H            ; H -> A }
    $B5/            {         OR    L               ; if H OR L = 0 -> Z = 1 }
    $C2/*-5/        {         JP    NZ, _IL2A       ; end of the inner loop }
    $15/            {         DEC   D               ; decrement relative delay value }
    $C2/*-12/       {         JP    NZ, _OL2A       ; end of the outer loop }
    $E1/            {         POP   HL              ; restore registers }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $ED/$79         {         OUT   (C), A          ; write out data }
  );
end;
