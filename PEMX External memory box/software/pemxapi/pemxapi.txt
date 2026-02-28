PEMX API
~~~~~~~~

  version	v0.1
  licence	EUPL v1.2
  architecture	Z80
  OS		CP/M-80
  compiler	SLR Systems Z80ASM v1.32 (1986)
  author	Pozsar Zsolt <pozsarzs@gmail.com> (2026)

This is a collection of routines for easy management of PEMX equipment.


Available functions
~~~~~~~~~~~~~~~~~~~

A	B	C	DE	functions			A
----------------------------------------------------------------------
ioaddr	N/A	00h	N/A	set I/O base address		N/A
N/A	N/A	01h	N/A	get I/O base address		ioaddr
N/A	N/A	02h	memaddr set 2 kB buffer mem. address	N/A
bank	page	10h	N/A	read data from EPROM to buffer	status

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

Status represents the execution status:
 - 0: no error,
 - 1: no Z80PIO on the specified port,
 - 2: invalid 'bank' value,
 - 4: invalid 'page' value.

