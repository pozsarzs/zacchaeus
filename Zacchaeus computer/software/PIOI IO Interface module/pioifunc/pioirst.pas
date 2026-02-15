{ +--------------------------------------------------------------------------+ }
{ | Zacchaeus Microcomputer                                                  | }
{ | Pozsar Zsolt <pozsarzs@gmail.com>, 2026. CC0 1.0 Universal               | }
{ | pioirst.pas                                                              | }
{ | Reset output program for CP/M-80 (sample program using PIOIFUNC)         | }
{ +--------------------------------------------------------------------------+ }

program pioirst;
const
  BA: byte = $0C;

{$I pioifgen.pas}
{$I pioifoco.pas}
{$I pioifrco.pas}

{ wait round x 255 x 255 x t }
procedure wait(round: byte);
begin
  inline(
    $3A/round/      {         LD    A, (round)      ; round -> A }
    $0E/$FF/        { WAIT0:  LD    C, 255          ; 255 -> C }
    $16/$FF/        { WAIT1:  LD    D, 255          ; 255 -> D }
    $15/            { WAIT2:  DEC   D               ; decrement D }
    $C2/*-2/        {         JP    NZ, WAIT2       ; if Z <> 0 goto WAIT2 }
    $0D/            {         DEC   C               ; decrement C }
    $C2/*-8/        {         JP    NZ, WAIT1       ; if Z <> 0 goto WAIT2 }
    $3D/            {         DEC   a               ; decrement B }
    $C2/*-14        {         JP    NZ, WAIT0       ; if Z = 0 goto WAIT2 }
  );
end;

begin
  setioaddr(BA);

  writeln('Reset OCO ports');
  writeoco($0F);
  wait(10);
  resetoco;

  wait(10);

  writeln('Reset RCO ports');
  writerco($F0);
  wait(10);
  resetrco;
end.
