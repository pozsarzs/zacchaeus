### My related projects on Github

- [An extended Turing machine implementation for CP/M and DOS](https://github.com/pozsarzs/alanz80x)
- [Turing machine implementation for CP/M and DOS](https://github.com/pozsarzs/alanz80)
- [Simulator for running DATAS machine code for CP/M and DOS](https://github.com/pozsarzs/datassim)
- [The FORTRAN Month](https://github.com/pozsarzs/fortran_month)

<hr>


<img align="left" style="float: left; margin: 0 10px 0 0;" alt="Z80 inside"
  src="pictures/icon/z180_64x64_black.png">
<br>

# Zacchaeus Microcomputer

**8-bit microcomputer built from commercially available and home-built components** 
  
This project is a personal journey back in time to the heroic age of computing:
a newly built, classic 8-bit system, in which I supplement the factory components
with modules of my own design. My goal is to revive the joy of discovery, while
on this new machine, legendary languages ​such as BASIC, Fortran or Cobol come to
life again.

<img align="left" style="float: center; margin: 0 10px 0 0;" alt="Appearance"
  src="pictures/equ_04.jpg" border="10">
<br>&nbsp;
  
## Features

|components      |type, size, etc.                             |
|----------------|---------------------------------------------|
|motherboard     |SC126                                        |
|firmware        |RomWBW SCZ180_sc126 v3.5.1 2025-05-21        |
|processor       |Z180 processor (33 MHz - at 18.432 MHz)      | 
|ROM             |2 x 512 kB byte Flash memory                 |
|RAM             |512 kB byte RAM                              |
|bus             |BP80 (extended RC2014 bus), 9 sockets        |                              |
|disks           |32 MB CF card                                |
|                |SD card                                      |
|others          |RTC                                          |
|control panel   |8 digits hexadecimal LED display             |
|                |8 data input switch                          |
|                |16 address input switch                      |
|                |8 control button                             |
|                |(partly implemented)                         |
|front connectors|1 x cassette (not yet implemented)           | 
|                |1 x earphone (not yet implemented)           |
|                |4 x protected digital input 12V              |
|                |4 x open collector output                    |
|                |4 x NO/NC relay contact output               |
|                |2 x analog input 0-10V (not yet implemented) | 
|                |2 x analog output 0-10V (not yet implemented)| 
|                |+12/5/3.3V 3A power outputs                  |
|                |-12/5V 0.5A power outputs                    |
|back connectors |2 x serial RS-232 (DB9M black)               |
|                |2 x serial RS-232 TTL (DB9M and DB25M blue)  |
|                |2 x paralel TTL (DB25F blue)                 |
|                |1 x CTC TTL (DB9F blue)                      |
|                |1 x spare DB9F (DB9F white)                  |
|                |1 x I<sup>2</sup>C TTL                       |
|                |1 x SPI TTL                                  |
|                |1 x Line out (not yet implemented)           |
|power supply    |ATX 600W                                     |
|OS              |Digital Research CP/M v2.2                   |
|                |Z-System                                     |


## Internal structure

The SCxxx modules are designed by Stephen C. Cousins, all information about
them can be found at [Small Computer Central](https://smallcomputercentral.com/)
site.

The Pxxx modules were designed by me, their documentation is available on
the [Github](https://github.com/pozsarzs/zacchaeus) and will soon be
available on my [homepage](http://www.pozsarzs.hu).

The machine is housed in a power supply cover (OMSZÖV OE-222) from the 1980s.

The computer consists of the following components:

|name   |function                                                      |
|-------|--------------------------------------------------------------|
|SC126  |motherboard                                                   |
|SC702  |RCBus backplane                                               |
|SC715  |RCBus CF module                                               |
|SC716  |RCBus SIO-2 module                                            |
|SC717  |RCBus PIO module                                              |
|SC718  |RCBus CTC module                                              |
|SC719  |RCBus DIO module                                              |
|PIOI   |I/O interface module                                          |
|PMAN-DP|Manual control panel - display module                         |
|PMAN-SW|Manual control panel - switch module                          |
|PPOW   |Power distribution module with external fuses                 |
|PSPK   |Speaker amplifier module with speaker                         |
|MCS-51M|2 pcs. TTL/RS232 level shifter module                         |
|       |ATX PC power supply                                           |

More information is available in the hardware folder.


### Planned modules

The __planning_ folder contains CAD files, notes, and other supporting
materials for the element under construction. These will later be moved
to their final location or deleted.

|name   |function                                                      |
|-------|--------------------------------------------------------------|
|PANA   |Analog input/output module (2AI, 2AO, 0-10V)                  |
|PCAS   |Cassette interface module                                     |
|PCOX   |Internal COVOX-style mono sound module with earphone amplifier [2]|
|PMAN-IF|Manual control panel - interface module                       |
|PEMX   |External memory box (EPROM bank) [2]                          |
|PEIX   |External interface box (for vintage Moeller PS316 I/O cards) [1] |

[1]: The circuit and software are currently under planning.
[2]: The circuit and software are currently under construction.
