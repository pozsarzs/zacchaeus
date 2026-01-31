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
      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$00/		{ LD	A, 0		; set output data }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write output data to port }
  );
end;

{ RESET ALL OCOS }
{ Global or specified data in registers:
    C: address }
procedure resetoco;
begin
  inline(
      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $06/$F0/		{ LD	B, 0F0h		; set mask }
      $A0/		{ AND	B		; merge bytes }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write output data to port }
  );
end;

{ RESET ALL RCOS }
{ Global or specified data in registers:
    C: address }
procedure resetrco;
begin
  inline(
      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $06/$0F/		{ LD	B, 0Fh		; set mask }
      $A0/		{ AND	B		; merge bytes }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write output data to port }
  );
end;

{ READ DATA FROM ALL PIS }
{ Global or specified data in registers:
    C: address }
function readallpi: byte;
begin
  inline(
      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $ED/$78/		{ IN	A, (C)		; read input data from port }
      $EE/$FF/		{ XOR	0FFh		; invert input data }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in DDCCBBAA format) }
    
      $E6/$01/		{ AND	01h		; detect state of 0th bit }
      $57/		{ LD	D, A		; store partial result }
    
      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$04/		{ AND	04h		; detect state of 2nd bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to partial result }
      $57/		{ LD	D, A		; store partial result }

      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$10/		{ AND	10h		; detect state of 4th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to partial result }
      $57/		{ LD	D, A		; store partial result }
  
      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$40/		{ AND	40h		; detect state of 6th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to partial result }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in 0000DCBA format) }

      $6F/		{ LD	L, A		; result low byte: A -> L }
      $26/$00/		{ LD	H, 0		; result high byte: 0 -> H }
      $A7/		{ AND	A		; reset Carry flag }
  );
end;

{ MASKED READ DATA FROM ALL PIS }
{ Global or specified data in registers:
    C: address
    E: mask }
function maskreadpi(mask: byte): byte;
begin
  inline(
      $3A/mask/		{ LD	A, (MASK)	; retrieve mask }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $ED/$78/		{ IN	A, (C)		; read input data from port }
      $EE/$FF/		{ XOR	0FFh		; invert input data }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in DDCCBBAA format) }
    
      $E6/$01/		{ AND	01h		; detect state of 0th bit }
      $57/		{ LD	D, A		; store partial result }
    
      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$04/		{ AND	04h		; detect state of 2nd bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to partial result }
      $57/		{ LD	D, A		; store partial result }

      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$10/		{ AND	10h		; detect state of 4th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to partial result }
      $57/		{ LD	D, A		; store partial result }
  
      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$40/		{ AND	40h		; detect state of 6th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to partial result }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in 0000DCBA format) }
      $A3/		{ AND	E		; mask input data }
      $E6/$0F/		{ AND	0Fh		; remove upper bits }

      $6F/		{ LD	L, A		; result low byte: A -> L }
      $26/$00/		{ LD	H, 0		; result high byte: 0 -> H }
      $A7/		{ AND	A		; reset Carry flag }
  );
end;

{ MASKED CHANGE CHECKING OF ALL PIS }
{ Global or specified data in registers:
    C: address
    D: save?
    E: mask }
function checkpi(save, mask: byte): byte;
label _sw12, _ch12, _done;
begin
  inline(
      $3A/save/		{ LD	A, (SAVE)	; retrieve mask }
      $57/		{ LD	D, A		; A -> D }

      $3A/mask/		{ LD	A, (MASK)	; retrieve mask }
      $5F/		{ LD	E, A		; A -> E }
   
      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $ED/$78/		{ IN	A, (C)		; read input data from port }
      $EE/$FF/		{ XOR	0FFh		; invert input data }
      $67/		{ LD	H, A		; store input data (in DDCCBBAA format) }

      $E6/$01/		{ AND	01h		; detect state of 0th bit }
      $47/		{ LD	B, A		; store partial result }

      $7C/		{ LD	A, H		; retrieve input data }
      $E6/$04/		{ AND	04h		; detect state of 2nd bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $B0/		{ OR	B		; add to partial result }
      $47/		{ LD	B, A		; store partial result }
    
      $7C/		{ LD	A, H		; retrieve input data }
      $E6/$10/		{ AND	10h		; detect state of 4th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B0/		{ OR	B		; add to partial result }
      $47/		{ LD	B, A		; store partial result }

      $7C/		{ LD	A, H		; retrieve input data }
      $E6/$40/		{ AND	40h		; detect state of 6th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B0/		{ OR	B		; add to partial result }
      $47/		{ LD	B, A		; store partial result }

      $7C/		{ LD	A, H		; retrieve input data }
      $A3/		{ AND	E		; mask input data }
      $47/		{ LD	B, A		; store masked input data }
    
      $3A/datinp/	{ LD	A, (DATINP)	; retrieve previous input data }
      $A3/		{ AND	E		; mask previous input data }
      $B8/		{ CP	B		; compare recent and previous data }
      $C2/_ch12/	{ JP	NZ, _CH12	; if not equal then goto label _CH12 }

      $F5/		{ PUSH	AF		; save registers }
      $7A/		{ LD	A, D		; D -> A }
      $FE/$00/		{ CP	A, 0		; if A = 0 then }
      $C8/		{ RET	Z		; - return }
      $7C/		{ LD	A, H		; - else retrieve input data }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in 0000DCBA format) }
      $F1/		{ POP	AF		; store registers }
      $3E/$00/		{ LD	A, 0		;   -> data is not changed }
      $A7/		{ AND	A		;   reset Carry flag }
      $18/_done/	{ JP	_DONE		; jump to _DONE label }	      

    _ch12:
      $F5/		{ PUSH	AF		; save registers }
      $7A/		{ LD	A, D		; D -> A }
      $FE/$00/		{ CP	A, 0		; if A = 0 then }
      $18/_done/	{ JP	_DONE		; - return }
      $7C/		{ LD	A, H		; - else retrieve input data }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in 0000DCBA format) }
      $F1/		{ POP	AF		; store registers }
      $3E/$FF/		{ LD	A, 0FFh		; -> data is changed }
      $A7/		{ AND	A		;   reset Carry flag }

    _done:
      $6F/		{ LD	L, A		; result low byte: A -> L }
      $26/$00/		{ LD	H, 0		; result high byte: 0 -> H }
  );
end;

{ READ STATE FROM A PI }
{ Global or specified data in registers:
    C: address
    E: port number }
function readpi(portnum: byte): byte;
label _lo18, _do18, _ze18, _done;
begin
  inline(
      $3A/portnum/	{ LD	A, (PORTNUM)	; portnum -> A }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $ED/$78/		{ IN	A, (C)		; read input data from port }
      $EE/$FF/		{ XOR	0FFh		; invert input data }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in DDCCBBAA format) }

      $E6/$01/		{ AND	01h		; detect state of 0th bit }
      $57/		{ LD	D, A		; store partial result }

      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$04/		{ AND	04h		; detect state of 2nd bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to result }
      $57/		{ LD	D, A		; store partial result }

      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$10/		{ AND	10h		; detect state of 4th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to result }
      $57/		{ LD	D, A		; store partial result }

      $3A/datinp/	{ LD	A, (DATINP)	; retrieve input data }
      $E6/$40/		{ AND	40h		; detect state of 6th bit }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $CB/$3F/		{ SRL	A		; shift left }
      $B2/		{ OR	D		; add to result }
      $32/datinp/	{ LD	(DATINP), A	; store input data (in 0000DCBA format) }

      $1C/		{ INC	E		; increment port number }
    _lo18:
      $1D/		{ DEC	E		; decrement port number, E = 0 -> Z = 0 }
      $CA/_do18/	{ JP	Z, _DO18	; if Z = 1 then goto _DO18 label }
      $CB/$3F/		{ SRL	A		; - else shift to right }
      $C3/_lo18/	{ JP	_LO18		;   goto _L018 label }
   _do18:
      $E6/$01/		{ AND	01h		; mask result }
      $28/_ze18/	{ JR	Z, _ZE18	; if the result is 0 then goto _ZE18 }
      $3E/$FF/		{ LD	A, 0FFh		; - else true output state }
      $A7/		{ AND	A		;   reset Carry flag }
      $18/_done/	{ JR	_DONE }
    _ze18:
      $AF/		{ XOR	A		; set A = 0 and reset Carry flag }

    _done:
      $6F/		{ LD	L, A		; result low byte: A -> L }
      $26/$00/		{ LD	H, 0		; result high byte: 0 -> H }
  );
end;

{ WRITE DATA TO ALL OCOS }
{ Global or specified data in registers:
    C: address
    D: data }
procedure writeoco(data: byte);
begin
  inline(
      $3A/data/		{ LD	A, (DATA)	; data -> A }
      $A3/$0F/		{ AND	0Fh		; mask output data }
      $57/		{ LD	D, A		; masked output data -> D }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/$F0/		{ AND	0F0h		; mask previous output data }
      $B2/		{ OR	D		; merge bytes }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write output data to port }
  );
end;

{ MASKED WRITE DATA TO ALL OCOS }
{ Global or specified data in registers:
    C: address
    D: data
    E: mask }
procedure maskwriteoco (data, mask: byte);
begin
  inline(
      $3A/data/		{ LD	A, (DATA)	; retrieve data }
      $57/		{ LD	D, A		; A -> D }

      $3A/mask/		{ LD	A, (MASK)	; retrieve mask }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $7B/		{ LD	A, E		; E -> A }
      $A3/$0F/		{ AND	0Fh		; mask the mask }      
      $5F/		{ LD	E, A		; A -> E }

      $7A/		{ LD	A, D		; D -> A }
      $A3/$0F/		{ AND	0Fh		; mask output data }
      $A3/		{ AND	E		; mask output data }
      $57/		{ LD	D, A		; masked output data -> D }
      
      $7B/		{ LD	A, E		; E -> A }
      $EE/$FF/		{ XOR	0FFh		; invert mask }
      $F6/$F0/		{ OR	0F0h		; protect high 4 bits }
      $5F/		{ LD	E, A		; A -> E }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; mask previous output data }
      $B2/		{ OR	D		; merge bytes }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ SWITCH ON A OCO PORT }
{ Global or specified data in registers:
    C: address
    E: port number }
procedure onoco(portnum: byte);
label _lo28, _do28;
begin
  inline(
      $3A/portnum/	{ LD	A, (PORTNUM)	; retrieve port number }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$01/		{ LD	A, 1		; starting place value }
      $43/		{ LD	B, E		; E -> B, shift counter }
      $04/		{ INC	B		; correction }

    _lo28:
      $05/		{ DEC	B		; if B = 0 }
      $28/_do28/	{ JR	Z, _DO28	; - the goto _DO28 label }
      $CB/$27/		{ SLA	A		; - else shift to left }
      $18/_lo28/	{ JR	_LO28		;   goto _LO28 label }

    _do28:
      $E6/$0F/		{ AND	0Fh		; mask the place value }
      $57/		{ LD	D, A		; A -> D }

      $EE/$FF/		{ XOR	0FFh		; invert place value }
      $F6/$F0/		{ OR	0F0h		; protect upper 4 bits }
      $5F/		{ LD	E, A		; A -> E (byte punch mask) }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; punch specified place }
      $B2/		{ OR	D		; put 1 to hole }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ SWITCH OFF A OCO PORT }
{ Global or specified data in registers:
    C: address
    E: port number }
procedure offoco(portnum: byte);
label _lo29, _do29;
begin
  inline(
      $3A/portnum/	{ LD	A, (PORTNUM)	; retrieve port number }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$01/		{ LD	A, 1		; starting place value }
      $43/		{ LD	B, E		; E -> B, shift counter }
      $04/		{ INC	B		; correction }

    _lo29:
      $05/		{ DEC	B		; if B = 0 }
      $28/_do29/	{ JR	Z, _DO29	; - the goto _DO29 label }
      $CB/$27/		{ SLA	A		; - else shift to left }
      $18/_lo29/	{ JR	_LO29		;   goto _LO29 label }

    _do29:
      $E6/$0F/		{ AND	0Fh		; mask the place value }
      $57/		{ LD	D, A		; A -> D }

      $EE/$FF/		{ XOR	0FFh		; invert place value }
      $F6/$F0/		{ OR	0F0h		; protect upper 4 bits }
      $5F/		{ LD	E, A		; A -> E (byte punch mask) }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; punch specified place }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ SWITCH ON AND DELAYED OFF A OCO PORT }
{ Global or specified data in registers:
    C: address
    D: relative delay
    E: port number }
procedure pulseoco(delay, portnum: byte);
label _lo2a, _do2a, _ol2a, _il2a;
begin
  inline(
      $3A/delay/	{ LD	A, (DELAY)	; retrieve delay }
      $57/		{ LD	D, A		; A -> D }

      $3A/portnum/	{ LD	A, (PORTNUM)	; retrieve port number }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$01/		{ LD	A, 1		; starting place value }
      $43/		{ LD	B, E		; E -> B, shift counter }
      $04/		{ INC	B		; correction }

    _lo2a:
      $05/		{ DEC	B		; if B = 0 }
      $28/_do2a/	{ JR	Z, _DO2A	; - the goto _DO2A label }
      $CB/$27/		{ SLA	A		; - else shift to left }
      $18/_lo2a/	{ JR	_LO2A		;   goto _LO2A label }

    _do2a:
      $E6/$0F/		{ AND	0Fh		; mask the place value }
      $67/		{ LD	H, A		; A -> H }

      $EE/$FF/		{ XOR	0FFh		; invert place value }
      $F6/$F0/		{ OR	0F0h		; protect upper 4 bits }
      $5F/		{ LD	E, A		; A -> E (byte punch mask) }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; punch specified place ) }
      $B4/		{ OR	H		; put 1 to hole }
      $ED/$79/		{ OUT	(C), A		; write out data }

      $E5/		{ PUSH	HL		; save registers }
    _ol2a:		{ 			; start of the outer loop }
      $21/$00/$40/	{ LD	HL, 4000h	; inner loop counter }
    _il2a:		{			; start of the inner loop }
      $00/		{ NOP			; waste of time }
      $2B/		{ DEC	HL		; decrement counter }
      $7C/		{ LD	A, H		; H -> A }
      $B5/		{ OR	L		; if H OR L = 0 -> Z = 1 }
      $C2/_il2a/	{ JP	NZ, _IL2A	; end of the inner loop }
      $15/		{ DEC	D		; decrement relative delay value }
      $C2/_ol2a/	{ JP	NZ, _OL2A	; end of the outer loop }
      $E1/		{ POP	HL		; restore registers }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ WRITE DATA TO ALL RCOS }
{ Global or specified data in registers:
    C: address
    D: data }
procedure writerco(data: byte);
begin
  inline(
    $3A/data/		{ LD	A, (DATA)	; data -> A }
    $A3/$F0/		{ AND	0F0h		; mask output data }
    $57/		{ LD	D, A		; masked output data -> D }

    $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
    $4F/		{ LD	C, A		; A -> C }

    $3A/datout/		{ LD	A, (DATOUT)	; retrieve previous output data }
    $A3/$0F/		{ AND	0Fh		; mask previous output data }
    $B2/		{ OR	D		; merge bytes }
    $32/datout/		{ LD	(DATOUT), A	; store output data }
    $ED/$79/		{ OUT	(C), A		; write output data to port }
  );
end;

{ MASKED WRITE DATA TO ALL RCOS }
{ Global or specified data in registers:
    C: address
    D: data
    E: mask }
procedure maskwriterco (data, mask: byte);
begin
  inline(
      $3A/data/		{ LD	A, (DATA)	; retrieve data }
      $57/		{ LD	D, A		; A -> D }

      $3A/mask/		{ LD	A, (MASK)	; retrieve mask }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $7B/		{ LD	A, E		; E -> A }
      $A3/$0F/		{ AND	0Fh		; mask the mask }      
      $CB/$27/		{ SLA	A		; shift left }
      $CB/$27/		{ SLA	A		; shift left }
      $CB/$27/		{ SLA	A		; shift left }
      $CB/$27/		{ SLA	A		; shift left }
      $5F/		{ LD	E, A		; A -> E }

      $7A/		{ LD	A, D		; D -> A }
      $CB/$27/		{ SLA	A		; shift left }
      $CB/$27/		{ SLA	A		; shift left }
      $CB/$27/		{ SLA	A		; shift left }
      $CB/$27/		{ SLA	A		; shift left }
      $A3/$0F/		{ AND	0Fh		; mask output data }
      $A3/		{ AND	E		; mask output data }
      $57/		{ LD	D, A		; masked output data -> D }
      
      $7B/		{ LD	A, E		; E -> A }
      $EE/$FF/		{ XOR	0FFh		; invert mask }
      $F6/$0F/		{ OR	0Fh		; set low bits to 1 }
      $5F/		{ LD	E, A		; A -> E }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; mask previous output data }
      $B2/		{ OR	D		; merge bytes }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ SWITCH ON A RCO PORT }
{ Global or specified data in registers:
    C: address
    E: port number }
procedure onrco(portnum: byte);
label _lo38, _do38;
begin
  inline(
      $3A/portnum/	{ LD	A, (PORTNUM)	; retrieve port number }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$01/		{ LD	A, 1		; starting place value }
      $43/		{ LD	B, E		; E -> B, shift counter }
      $04/		{ INC	B		; correction }

    _lo38:
      $05/		{ DEC	B		; if B = 0 }
      $28/_do38/	{ JR	Z, _DO38	; - the goto _DO38 label }
      $CB/$27/		{ SLA	A		; - else shift to left }
      $18/_lo38/	{ JR	_LO38		;   goto _LO38 label }

    _do38:
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $57/		{ LD	D, A		; A -> D }

      $EE/$FF/		{ XOR	0FFh		; invert place value }
      $F6/$0F/		{ OR	0Fh		; protect lower 4 bits }
      $5F/		{ LD	E, A		; A -> E (byte punch mask) }

      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ SWITCH OFF A RCO PORT }
{ Global or specified data in registers:
    C: address
    E: port number }
procedure offrco(portnum: byte);
label _lo39, _do39;
begin
  inline(
      $3A/portnum/	{ LD	A, (PORTNUM)	; retrieve port number }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$01/		{ LD	A, 1		; starting place value }
      $43/		{ LD	B, E		; E -> B, shift counter }
      $04/		{ INC	B		; correction }

    _lo39:
      $05/		{ DEC	B		; if B = 0 }
      $28/_do39/	{ JR	Z, _DO39	; - the goto _DO39 label }
      $CB/$27/		{ SLA	A		; - else shift to left }
      $18/_lo39/	{ JR	_LO39		;   goto _LO39 label }

    _do39:
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $57/		{ LD	D, A		; A -> D }

      $EE/$FF/		{ XOR	0FFh		; invert place value }
      $F6/$0F/		{ OR	0Fh		; protect lower 4 bits }
      $5F/		{ LD	E, A		; A -> E (byte punch mask) }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; punch specified place }
      $32/datout/	{ LD	(DATOUT), A	; store output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;

{ SWITCH ON AND DELAYED OFF A RCO PORT }
{ Global or specified data in registers:
    C: address
    D: relative delay
    E: port number }
procedure pulserco(delay, portnum: byte);
label _lo3a, _do3a, _ol3a, _il3a;
begin
  inline(
      $3A/delay/	{ LD	A, (DELAY)	; retrieve delay }
      $57/		{ LD	D, A		; A -> D }

      $3A/portnum/	{ LD	A, (PORTNUM)	; retrieve port number }
      $5F/		{ LD	E, A		; A -> E }

      $3A/addr/		{ LD	A, (ADDR)	; retrieve i/o address }
      $4F/		{ LD	C, A		; A -> C }

      $3E/$01/		{ LD	A, 1		; starting place value }
      $43/		{ LD	B, E		; E -> B, shift counter }
      $04/		{ INC	B		; correction }

    _lo3a:
      $05/		{ DEC	B		; if B = 0 }
      $28/_do3a/	{ JR	Z, _DO3A	; - the goto _DO3A label }
      $CB/$27/		{ SLA	A		; - else shift to left }
      $18/_lo3a/	{ JR	_LO3A		;   goto _LO3A label }

    _do3a:
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $07/		{ RLCA			; shift: D0-D3 -> D4-D7 }
      $67/		{ LD	H, A		; A -> H }

      $EE/$FF/		{ XOR	0FFh		; invert place value }
      $F6/$0F/		{ OR	0Fh		; protect lower 4 bits }
      $5F/		{ LD	E, A		; A -> E (byte punch mask) }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $A3/		{ AND	E		; punch specified place ) }
      $B4/		{ OR	H		; put 1 to hole }
      $ED/$79/		{ OUT	(C), A		; write out data }

      $E5/		{ PUSH	HL		; save registers }
    _ol3a:		{ 			; start of the outer loop }
      $21/$00/$40/	{ LD	HL, 4000h	; inner loop counter }
    _il3a:		{			; start of the inner loop }
      $00/		{ NOP			; waste of time }
      $2B/		{ DEC	HL		; decrement counter }
      $7C/		{ LD	A, H		; H -> A }
      $B5/		{ OR	L		; if H OR L = 0 -> Z = 1 }
      $C2/_il3a/	{ JP	NZ, _IL3A	; end of the inner loop }
      $15/		{ DEC	D		; decrement relative delay value }
      $C2/_ol3a/	{ JP	NZ, _OL3A	; end of the outer loop }
      $E1/		{ POP	HL		; restore registers }

      $3A/datout/	{ LD	A, (DATOUT)	; retrieve previous output data }
      $ED/$79/		{ OUT	(C), A		; write out data }
  );
end;
