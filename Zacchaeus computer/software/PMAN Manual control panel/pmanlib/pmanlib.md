PMAN API for Zacchaeus Microcomputer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  version	v0.1
  licence	EUPL v1.2
  architecture	Z80
  OS		CP/M-80
  compiler	SLR Systems Z80ASM v1.32 (1986)
  author	Pozsar Zsolt <pozsarzs@gmail.com> (2026)

This is a collection of routines for easy management of the manual control
panel's buttons, switches, LEDs and hexadecimal LED displays.

Available functions
~~~~~~~~~~~~~~~~~~~

|     A      |     B     |         HL        | name |      A     |       HL       |
|:----------:|:---------:|:-----------------:|:----:|:----------:|:--------------:|
|I/O address |           |buffer address     |IFINIT|            |                |
|on/off (0/?)|           |                   |DPBLNK|            |                |
|number (0-F)|digit (0-7)|                   |DPWDIG|            |                |
|data (00-FF)|           |address (0000-FFFF)|DPWAAD|            |                |
|data (00-FF)|           |                   |DPWBYB|            |                |
|data (00-FF)|           |                   |DPWBYH|            |                |
|            |           |                   |DPWMIR|            |                |
|            |           |data (0000-FFFF)   |DPWWRD|            |                |
|            |           |                   |SWRADD|            |data (0000-FFFF)|
|            |           |                   |SWRBTN|data (00-3F)|                |
|            |           |                   |SWRDAT|data (00-FF)|                |
|            |           |                   |SWRMIR|            |                |
|number (0-F)|           |                   |SWWLED|            |                |

Note:
~~~~~
- In the event of an error, CF becomes 1, register A contains the error code.
- The value of registers not used to store results remains unchanged.

Hardware access
~~~~~~~~~~~~~~~~

displays on PCB: DIS1	...	DIS8
logical name:    DIG0	...	DIG7

addr.	write to			read from
---------------------------------------------------------
BA	h/l n: DIG7/DIG3
BA + 1	h/l n: DIG6/DIG2
BA + 2	h/l n: DIG5/DIG1
BA + 3	h/l n: DIG4/DIG0	
BA + 4	xxxBERPS
BA + 5
BA + 6
BA + 7

Note:
- 'BA' is means base I/O address of the interface.
- 'h/l n' is means the high and low nibbles.
- 'BERPS' is means display blank and following LEDs: Error (D31), Run (D32),
  Pause (D33), Stop (D34).




