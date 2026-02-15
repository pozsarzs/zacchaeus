{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus Microcomputer                                                  | }
{ | Pozsar Zsolt <pozsarzs@gmail.com>, 2026. CC0 1.0 Universal               | }
{ | pioifpi.pas                                                              | }
{ | PI functions                                                             | }
{ +--------------------------------------------------------------------------+ }

{ READ DATA FROM ALL PIS }
function readallpi: byte;
begin
  inline(
    { initial value(s) }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $ED/$78/        {         IN    A, (C)          ; read input data from port }
    $EE/$FF/        {         XOR   0FFh            ; invert input data }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in DDCCBBAA format) }

    $E6/$01/        {         AND   01h             ; detect state of 0th bit }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$04/        {         AND   04h             ; detect state of 2nd bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to partial result }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$10/        {         AND   10h             ; detect state of 4th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to partial result }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$40/        {         AND   40h             ; detect state of 6th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to partial result }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in 0000DCBA format) }

    { result }
    $6F/            {         LD    L, A            ; result low byte: A -> L }
    $26/$00/        {         LD    H, 0            ; result high byte: 0 -> H }
    $A7             {         AND   A               ; reset Carry flag }
  );
end;

{ MASKED READ DATA FROM ALL PIS }
function maskreadpi(mask: byte): byte;
begin
  inline(
    { initial value(s) }
    $3A/mask/       {         LD    A, (MASK)       ; retrieve mask }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $ED/$78/        {         IN    A, (C)          ; read input data from port }
    $EE/$FF/        {         XOR   0FFh            ; invert input data }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in DDCCBBAA format) }

    $E6/$01/        {         AND   01h             ; detect state of 0th bit }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$04/        {         AND   04h             ; detect state of 2nd bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to partial result }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$10/        {         AND   10h             ; detect state of 4th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to partial result }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$40/        {         AND   40h             ; detect state of 6th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to partial result }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in 0000DCBA format) }
    $A3/            {         AND   E               ; mask input data }
    $E6/$0F/        {         AND   0Fh             ; remove upper bits }

    { result }
    $6F/            {         LD    L, A            ; result low byte: A -> L }
    $26/$00/        {         LD    H, 0            ; result high byte: 0 -> H }
    $A7             {         AND   A               ; reset Carry flag }
  );
end;

{ MASKED CHANGE CHECKING OF ALL PIS }
function checkpi(save, mask: byte): byte;
begin
  inline(
    { initial value(s) }
    $3A/save/       {         LD    A, (SAVE)       ; retrieve mask }
    $57/            {         LD    D, A            ; A -> D }
    $3A/mask/       {         LD    A, (MASK)       ; retrieve mask }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $ED/$78/        {         IN    A, (C)          ; read input data from port }
    $EE/$FF/        {         XOR   0FFh            ; invert input data }
    $67/            {         LD    H, A            ; store input data (in DDCCBBAA format) }

    $E6/$01/        {         AND   01h             ; detect state of 0th bit }
    $47/            {         LD    B, A            ; store partial result }

    $7C/            {         LD    A, H            ; retrieve input data }
    $E6/$04/        {         AND   04h             ; detect state of 2nd bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B0/            {         OR    B               ; add to partial result }
    $47/            {         LD    B, A            ; store partial result }

    $7C/            {         LD    A, H            ; retrieve input data }
    $E6/$10/        {         AND   10h             ; detect state of 4th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B0/            {         OR    B               ; add to partial result }
    $47/            {         LD    B, A            ; store partial result }

    $7C/            {         LD    A, H            ; retrieve input data }
    $E6/$40/        {         AND   40h             ; detect state of 6th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B0/            {         OR    B               ; add to partial result }
    $47/            {         LD    B, A            ; store partial result }

    $7C/            {         LD    A, H            ; retrieve input data }
    $A3/            {         AND   E               ; mask input data }
    $47/            {         LD    B, A            ; store masked input data }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve previous input data }
    $A3/            {         AND   E               ; mask previous input data }
    $B8/            {         CP    B               ; compare recent and previous data }
    $C2/*+18/       {         JP    NZ, _CH12       ; if not equal then goto label _CH12 }

    $F5/            {         PUSH  AF              ; save registers }
    $7A/            {         LD    A, D            ; D -> A }
    $FE/$00/        {         CP    A, 0            ; if A = 0 then }
    $C8/            {         RET   Z               ; - return }
    $7C/            {         LD    A, H            ; - else retrieve input data }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in 0000DCBA format) }
    $F1/            {         POP   AF              ; store registers }
    $3E/$00/        {         LD    A, 0            ;   -> data is not changed }
    $A7/            {         AND   A               ;   reset Carry flag }
    $18/*+17/       {         JP    _DONE           ; jump to _DONE label }

    $F5/            { _CH12:  PUSH  AF              ; save registers }
    $7A/            {         LD    A, D            ; D -> A }
    $FE/$00/        {         CP    A, 0            ; if A = 0 then }
    $18/*+10/       {         JP    _DONE           ; - return }
    $7C/            {         LD    A, H            ; - else retrieve input data }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in 0000DCBA format) }
    $F1/            {         POP   AF              ; store registers }
    $3E/$FF/        {         LD    A, 0FFh         ; -> data is changed }
    $A7/            {         AND   A               ;   reset Carry flag }

    $6F/            { _DONE:  LD    L, A            ; result low byte: A -> L }
    $26/$00         {         LD    H, 0            ; result high byte: 0 -> H }
  );
end;

{ READ STATE FROM A PI }
function readpi(portnum: byte): byte;
begin
  inline(
    { initial value(s) }
    $3A/portnum/    {         LD    A, (PORTNUM)    ; portnum -> A }
    $5F/            {         LD    E, A            ; A -> E }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $ED/$78/        {         IN    A, (C)          ; read input data from port }
    $EE/$FF/        {         XOR   0FFh            ; invert input data }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in DDCCBBAA format) }

    $E6/$01/        {         AND   01h             ; detect state of 0th bit }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$04/        {         AND   04h             ; detect state of 2nd bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to result }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$10/        {         AND   10h             ; detect state of 4th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to result }
    $57/            {         LD    D, A            ; store partial result }

    $3A/datinp/     {         LD    A, (DATINP)     ; retrieve input data }
    $E6/$40/        {         AND   40h             ; detect state of 6th bit }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $CB/$3F/        {         SRL   A               ; shift left }
    $B2/            {         OR    D               ; add to result }
    $32/datinp/     {         LD    (DATINP), A     ; store input data (in 0000DCBA format) }

    $1C/            {         INC   E               ; increment port number }
    $1D/            { _LO18:  DEC   E               ; decrement port number, E = 0 -> Z = 0 }
    $CA/*+7/        {         JP    Z, _DO18        ; if Z = 1 then goto _DO18 label }
    $CB/$3F/        {         SRL   A               ; - else shift to right }
    $C3/*-7/        {         JP    _LO18           ;   goto _L018 label }
    $E6/$01/        { _DO18:  AND   01h             ; mask result }
    $28/5/          {         JR    Z, _ZE18        ; if the result is 0 then goto _ZE18 }
    $3E/$FF/        {         LD    A, 0FFh         ; - else true output state }
    $A7/            {         AND   A               ;   reset Carry flag }
    $18/1/          {         JR    _DONE }
    $AF/            { _ZE18:  XOR   A               ; set A = 0 and reset Carry flag }

    $6F/            { _DONE:  LD    L, A            ; result low byte: A -> L }
    $26/$00         {         LD    H, 0            ; result high byte: 0 -> H }
  );
end;
