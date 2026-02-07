{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus Microcomputer                                                  | }
{ | Pozsar Zsolt <pozsarzs@gmail.com>, 2026. CC0 1.0 Universal               | }
{ | pioifgen.pas                                                             | }
{ | General functions                                                        | }
{ +--------------------------------------------------------------------------+ }

var
  addr, datinp, datout: byte;

{ SET ADDRESS }
procedure setbase(address: byte);
begin
  addr := address;
  datinp := 0;
  datout := 0;
end;

{ GET ADDRESS }
function getbase: byte;
begin
  getbase := addr;
end;

{ RESET ALL OCOS AND RCOS }
procedure resetall;
begin
  inline(
    { initial value(s) }
    $3A/addr/       {         LD    A, (addr)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3E/$00/        {         LD    A, 0            ; set output data }
    $32/datout/     {         LD    (datout), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write output data to port }
  );
end;

{ RESET ALL OCOS }
procedure resetoco;
begin
  inline(
    { initial value(s) }
    $3A/addr/       {         LD    A, (addr)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/datout/     {         LD    A, (datout)     ; retrieve previous output data }
    $06/$F0/        {         LD    B, 0F0h         ; set mask }
    $A0/            {         AND   B               ; merge bytes }
    $32/datout/     {         LD    (datout), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write output data to port }
  );
end;

{ RESET ALL RCOS }
procedure resetrco;
begin
  inline(
    { initial value(s) }
    $3A/addr/       {         LD    A, (addr)       ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/datout/     {         LD    A, (datout)     ; retrieve previous output data }
    $06/$0F/        {         LD    B, 0Fh          ; set mask }
    $A0/            {         AND   B               ; merge bytes }
    $32/datout/     {         LD    (datout), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write output data to port }
  );
end;
