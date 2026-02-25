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
  ioaddr, bank, page: byte;
  memaddr: integer;

{ SET I/O ADDRESS }
procedure setioaddr(address: byte);
begin
  ioaddr := address;
end;

{ GET I/O ADDRESS }
function getioaddr: byte;
begin
  getbase := ioaddr;
end;

{ SET BUFFER ADDRESS }
procedure setmemaddr(address: integer);
begin
  memaddr := address;
end;

{ READ DATA FROM EPROM TO BUFFER }
function readblock(bank, page: byte): byte;
begin

{..}

end;
