{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus * PIOI interface module                                        | }
{ | Copyright (C) 2025-2026 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | pioirst.pas                                                              | }
{ | Reset output program for CP/M-80 (sample program using PIOIFUNC)         | }
{ +--------------------------------------------------------------------------+ }

program pioirst;
const
  BA: byte = $0C;

{$I pioigen.pas}
{$I pioioco.pas}
{$I pioirco.pas}
{$I pioipi.pas}

procedure wait;
begin
  inline(
    $06/$0B/        {         LD    B, 10           ; 10 -> B }
    $0E/$FF/        { WAIT0:  LD    C, 255          ; 255 -> C }
    $16/$FF/        { WAIT1:  LD    D, 255          ; 255 -> D }
    $15/            { WAIT2:  DEC   D               ; decrement D }
    $C2/*-2/        {         JP    NZ, WAIT2       ; if D <> 0 goto WAIT2 }
    $0D/            {         DEC   C               ; decrement C }
    $C2/*-8/        {         JP    NZ, WAIT1       ; if D <> 0 goto WAIT2 }
    $05/            {         DEC   B               ; decrement B }
    $C2/*-14/       {         JP    NZ, WAIT0       ; if D <> 0 goto WAIT2 }
  );
end;

begin
  setbase(BA);

  writeln('Reset OCO ports')
  writeoco($FF);
  wait;
  resetoco;

  wait;

  writeln('Reset RCO ports')
  writerco($FF);
  wait;
  resetrco;
end.
