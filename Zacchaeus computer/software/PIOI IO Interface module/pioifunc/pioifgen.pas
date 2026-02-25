{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus Microcomputer                                                  | }
{ | Copyright (C) 2025 Pozsar Zsolt <pozsarzs@gmail.com>                     | }
{ | pioifgen.pas                                                             | }
{ | General functions, Z80, CP/M-80, v0.1                                    | }
{ +--------------------------------------------------------------------------+ }

{ This program is free software: you can redistribute it and/or modify it
  under the terms of the European Union Public License 1.2 version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE. }

var
  ioaddr, datinp, datout: byte;

{ SET I/O ADDRESS }
procedure setioaddr(ioaddress: byte);
begin
  ioaddr := ioaddress;
  datinp := 0;
  datout := 0;
end;

{ GET I/O ADDRESS }
function getioaddr: byte;
begin
  getbase := ioaddr;
end;

{ RESET ALL OCOS AND RCOS }
procedure resetall;
begin
  inline(
    { initial value(s) }
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
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
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
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
    $3A/ioaddr/     {         LD    A, (ioaddr)     ; retrieve i/o address }
    $4F/            {         LD    C, A            ; A -> C }

    $3A/datout/     {         LD    A, (datout)     ; retrieve previous output data }
    $06/$0F/        {         LD    B, 0Fh          ; set mask }
    $A0/            {         AND   B               ; merge bytes }
    $32/datout/     {         LD    (datout), A     ; store output data }
    $ED/$79         {         OUT   (C), A          ; write output data to port }
  );
end;
