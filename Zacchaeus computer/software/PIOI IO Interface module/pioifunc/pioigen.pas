{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus * PIOI interface module                                        | }
{ | Copyright (C) 2025 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | pioifunc.pas                                                             | }
{ | Functions of the PIOI interface for CP/M-80                              | }
{ +--------------------------------------------------------------------------+ }

var
  addr, datinp, datout: byte;

{ SET ADDRESS }
procedure setbase(address: byte);
begin
  addr := address;
end;

{ GET ADDRESS }
function getbase: byte;
begin
  getbase := addr;
end;

{ RESET ALL OCOS AND RCOS }
{ Global or specified data in registers:
    C: address }
procedure resetall;
begin
  inline(
    { initial value(s) }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$00/        {         LD    A, 0            ; set output data }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write output data to port }
  );
end;

{ RESET ALL OCOS }
{ Global or specified data in registers:
    C: address }
procedure resetoco;
begin
  inline(
    { initial value(s) }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $06/$F0/        {         LD    B, 0F0h         ; set mask }
    $A0/            {         AND   B               ; merge bytes }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write output data to port }
  );
end;

{ RESET ALL RCOS }
{ Global or specified data in registers:
    C: address }
procedure resetrco;
begin
  inline(
    { initial value(s) }
    $3A/addr/       {         LD    A, (ADDR)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/datout/     {         LD    A, (DATOUT)     ; retrieve previous output data }
    $06/$0F/        {         LD    B, 0Fh          ; set mask }
    $A0/            {         AND   B               ; merge bytes }
    $32/datout/     {         LD    (DATOUT), A     ; store output data }
    $ED/$79/        {         OUT   (C), A          ; write output data to port }
  );
end;
