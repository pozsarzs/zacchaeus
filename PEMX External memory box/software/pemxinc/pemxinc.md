PEMX functions
~~~~~~~~~~~~~~

  version	v0.1
  licence	EUPL v1.2
  architecture	Z80
  OS		CP/M-80
  compiler	Borland Turbo Pascal v3.01A (1985)
  author	Pozsar Zsolt <pozsarzs@gmail.com> (2026)

This is a collection of routines for easy management of PEMX equipment.


Available functions
~~~~~~~~~~~~~~~~~~~

name						functions				A
------------------------------------------------------------------------------
procedure setioaddr(address: byte);		set i/o base address
function getioaddr: byte;			get i/o base address
procedure setmemaddr(address: integer);		set 2 kB buffer mem. address
function readblock(bank, page: byte): byte;	read data from EPROM to buffer

The 'ioaddr' is the base address of the PIO port, and the 'memaddr' is the
address of the reserved 2 kB read buffer area. The data read from the EPROM is
placed here.

The 'bank' is a variable corresponding to the hardware EPROM bank number, its
value can be 0..7.

The 'page' represents the sequence number of the 2 kB read block. Its value can
be for the following EPROMs:

 - 2764: 0-4,
 - 27128: 0-8,
 - 27256: 0-16,
 - 27512: 0-31.

Result of the 'readblock' function represents the execution status:
 - 0: no error,
 - 1: no Z80PIO on the specified port,
 - 2: invalid 'bank' value,
 - 4: invalid 'page' value.
