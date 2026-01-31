{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus * PIOI interface module                                        | }
{ | Copyright (C) 2025-2026 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | pioirst.pas                                                              | }
{ | Reset output program for CP/M-80 (sample program using PIOIFUNC)         | }
{ +--------------------------------------------------------------------------+ }

program pioirst;
const
  BA: byte = $0C;

{$I pioifunc.pas}

procedure wait;
label
  wait0, wait1, wait2;
begin
  inline(
      $06/$0B/		{ LD	B, 10 }
    wait0:
      $0E/$FF/		{ LD	C, 255 }
    wait1:
      $16/$FF/		{ LD	D, 255 }
    wait2:
      $15/		{ DEC	D }
      $C2/wait2/	{ JP	NZ, WAIT2 }
      $0D/		{ DEC	C }
      $C2/wait1/	{ JP	NZ, WAIT1 }
      $05/		{ DEC	B }
      $C2/wait0/	{ JP	NZ, WAIT0 }
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
