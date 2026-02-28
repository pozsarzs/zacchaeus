{ +--------------------------------------------------------------------------+ }
{ | PEMX External memory box (EPROM bank)                                    | }
{ | Copyright (C) 2025-2026 Pozsar Zsolt <pozsarzs@gmail.com>                | }
{ | emxdump.pas                                                              | }
{ | Data lister and saver utility, Z80, CP/M-80, v0.1                        | }
{ +--------------------------------------------------------------------------+ }

{ This program is free software: you can redistribute it and/or modify it
  under the terms of the European Union Public License 1.2 version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
  FOR A PARTICULAR PURPOSE. }

program emxdump;
type
  PByte = ^byte;
  TStr2 = string[2];
  TStr4 = string[4];
  TStr15 = string[15];
  TStr72 = string[72];
  TPOptions = record
                a, b, cmd, s: integer;
                f: TStr15; { du:filename.ext }
              end;
const
  allcommands: array[1..2] of char = ('D','S');
  alloptions: array[1..4] of char = ('A','B','F','S');
  da = 12;
  db = 0;
  ds = 8;
var
  buffer: PByte;
  options: TPOptions;
  page: byte;

{ I pemxfunc/pemxfunc.pas}

{ WAIT FOR A KEY }
procedure waitforkey;
begin
  bdos($01);
  writeln;
end;

{ DETECT KEYPRESS }
function keypress: boolean;
begin
  if bdos($0b, 0) = $ff
    then keypress := true
    else keypress := false;
end;

{ READ A KEY FROM STANDARD INPUT }
function keyread: char;
begin
  if bdos($0b, 0) = $ff
    then keyread := chr(bdos($01, 0))
    else keyread := '';
end;

{ INSERT ZERO BEFORE [0-9] }
function addzero(value: integer): TStr2;
var
  result: TStr2;
begin
  str(value:0, result);
  if length(result) = 1 then result := '0' + result;
    addzero := result;
end;

{ CONVERT DEC NUMBER TO HEXA }
function bhex(d: byte): TStr2;
var
  b: byte;
  c: char;
  s: TStr2;
begin
  s := '';
  for b := 0 to 1 do
  begin
    b := d mod 16;
    d := d div 16;
    if b < 10 then c := char(b + 48) else c := char(b + 55);
    s := c + s;
  end;
  bhex := s;
end;


{ SHOW HOW TO USE }
procedure howtouse;
begin
  writeln('(C) 2025-2026 Pozsar Zsolt <pozsarzs@gmail.com> EUPL v1.2');
  writeln('Data lister and saver utility');
  writeln;
  writeln('usage:');
  writeln('  emxdump command [options]');
  writeln;
  writeln('commands:');
  writeln('  (d)ump - Print the entire EPROM contents to the screen or to a file in');
  writeln('           readable hexadecimal format.');
  writeln('  (s)ave - Save the entire EPROM contents to a file in binary format.');
  writeln;
  writeln('options:');
  writeln('  /a:0..255     - base adress of the Z80PIO (default: 12)');
  writeln('  /b:0..7       - EPROM bank (default: 0)');
  writeln('  /f:file       - target file (default: target.bin)');
  writeln('  /s:8|16|32|64 - EPROM size in kB (default: 8)');
  writeln;
  writeln('examples:');
  writeln('  emxdump d /b:7 /s:32 /f:eprom.lst');
  writeln('  emxdump s /f:eprom.bin /b:7 /s:32');
  writeln;
  halt;
end;

{ DETECT OPERATION MODE }
function detectcmd(p: TStr2; var pvar: integer): boolean;
var
  b: byte;
begin
  pvar := 0;
  for b := 1 to 2 do
    if p = allcommands[b] then pvar := b;
  if pvar > 0 then detectcmd := true else detectcmd := false;
end;

{ DETECT VALID COMMAND LINE OPTIONS }
function detectoptions(c: byte; r: TPOptions): boolean;
var
  b, bb: byte;
  i, e: integer;
  found, result: boolean;
  s: string[18];
begin
  detectoptions := false;
  { check bad options }
  found := false;
  result := true;
  for b := 2 to c do
    begin
      found := false;
      for bb := 1 to 4 do
      begin
        s := paramstr(b);
        if length(s) > 3 then
        if (s[1] = '/') and (s[2] = alloptions[bb]) and (s[3] = ':') then
        begin
          found := true;
          case bb of
            1: begin
                 delete(s, 1, 3);
                 val(s, i, e);
                 if (i < 0) or (i > 255)
                   then found := false
                   else options.a := i;
               end;
            2: begin
                 delete(s, 1, 3);
                 val(s, i, e);
                 if (i < 0) or (i > 7)
                   then found := false
                   else options.b := i;
               end;
            3: begin
                 delete(s, 1, 3);
                 options.f := s;
               end;
            4: begin
                 delete(s, 1, 3);
                 val(s, i, e);
                 writeln(i);
                 if (i <> 8) and (i <> 16) and (i <> 32) and (i <> 64)
                   then found := false
                   else options.s := i;
               end;
          end;
        end;
      end;
      result  := result and found;
    end;
    detectoptions := result;
end;

{ SHOW ERROR MESSAGE AND HALT }
procedure error(ec: byte; s: TStr72);
begin
  write('ERR', ec, ': ');
  case ec of
    1: write('Cannot write data to file ', s, '!');
    2: write('Cannot allocate memory for buffer!');
  end;
  { release buffer area }
  freemem(buffer, 2048);
  halt;
end;

{ WRITE DATA FROM BUFFER AREA TO SCREEN IN READABLE FORMAT }
procedure dumptoscreen(page: byte);
var
  b, l: byte;
  i: integer;
begin
  for l := 0 to 127 do
  begin
    { address at the start of line }
    write(bhex(hi(l * 16 + page * 2048)),
          bhex(lo(l * 16 + page * 2048)),'  ');
    { 16 byte in hexadecimal format }
    for b := 0 to 15 do
      write(bhex(mem[addr(buffer^) + b + l * 16]), ' ');
      write(' ');
    { 16 byte in character format }
    for b := 0 to 15 do
    begin
      i := addr(buffer^) + b + l * 16;
      if (mem[i] > 31) and (mem[i] < 127)
        then write(char(mem[i]))
        else write('.');
    end;
    writeln;
  end;
end;

{ WRITE DATA FROM BUFFER AREA TO DISC IN READABLE FORMAT }
function dumptodisc(f: TStr15; page: byte): boolean;
begin
end;

{ WRITE DATA FROM BUFFER AREA TO DISC IN BINARY FORMAT }
function savetodisc(f: TStr15): boolean;
begin
end;

begin
  writeln('*** PEMX External memory box (EPROM bank) ***');
  if paramcount = 0 then howtouse else
    { detect command }
    if detectcmd(paramstr(1), options.cmd) then
    begin
      { set default values }
      with options do
      begin
        a := da;
        b := db;
        s := ds;
        if cmd = 1 then f := #20 else f := 'EPROM.BIN';
      end;
      { detect options }
      if detectoptions(paramcount, options) then
      begin
        { main }
        with options do
        begin
          write(  'Operation:        ');
          if (cmd = 1) and (f = #20) then writeln('dump to screen');
          if (cmd = 1) and (f <> #20) then writeln('dump to file');
          if (cmd = 2) then writeln('save to file');
          writeln('Base I/O address: ', a);
          writeln('EPROM bank:       ', b);
          writeln('EPROM size:       ', s, ' kB');
          if (f <> #20) then writeln('Target file:      ', f);
          writeln;
          page := 0;
          { allocate buffer area }
          getmem(buffer, 2048);
          if buffer = nil then error(2, '');
          { set address of Z80PIO and buffer area }
          { setioaddress(a); }
          { setmemaddress(addr(buffer)); }
          repeat
            { fillchar(buffer^, 2048, 0);}
            { read a 2 kB block to memory }
            { readblock(b, page); }
            { write data to target medium}
            if (cmd = 1) and (f = #20) then dumptoscreen(page);
            if (cmd = 1) then
              if not dumptodisc(f, page) then error(1, f);
            if (cmd = 2) then
              if not savetodisc(f) then error(1, f);
            page := page + 1;
          until page * 2 = s;
          { release buffer area }
          freemem(buffer, 2048);
        end;
      end else howtouse;
    end else howtouse;
  halt;
end.