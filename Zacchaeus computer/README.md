<img align="left" style="float: left; margin: 0 10px 0 0;" alt="Z80 inside"
  src="../pictures/icon/z180_64x64_black.png">
<br>

# Zacchaeus Microcomputer
  
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
|front connectors|1 x tape (not yet implemented)               | 
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

<img align="left" style="float: center; margin: 0 10px 0 0;" alt="Appearance"
  src="pictures/equ_04.jpg" border="10">
<br>&nbsp;

### Internal structure

The SCxxx modules are designed by Stephen C. Cousins, all information about
them can be found at [Small Computer Central](https://smallcomputercentral.com/)
site.

The Pxxx modules were designed by me, their documentation is available on
the [Github](https://github.com/pozsarzs/zacchaeus) and will soon be
available on my [homepage](http://www.pozsarzs.hu).

The machine is housed in a power supply cover (OMSZÖV OE-222) from the 1980s.

The computer consists of the following components:

|name   |function                                                  |
|-------|----------------------------------------------------------|
|SC126  |motherboard                                               |
|SC702  |RCBus backplane                                           |
|SC715  |RCBus CF module                                           |
|SC716  |RCBus SIO-2 module                                        |
|SC717  |RCBus PIO module                                          |
|SC718  |RCBus CTC module                                          |
|SC719  |RCBus DIO module                                          |
|PIOI   |I/O interface module                                      |
|PMAN-DP|Manual control panel - display module (currently not used)|
|PMAN-SW|Manual control panel - switch module (currently not used) |
|PPOW   |Power distribution module with external fuses             |
|PSPK   |Speaker amplifier module with speaker (currently not used)|
|MCS-51M|2 pcs. TTL/RS232 level shifter module                     |
|       |ATX PC power supply                                       |


### Planned equipments and modules

|name   |function                                                      |
|-------|--------------------------------------------------------------|
|PANA   |Analog input/output module (2AI, 2AO, 0-10V)                  |
|PCOX   |Internal COVOX-style mono sound module with earphone amplifier [3]|
|PEIX   |External interface box (for vintage Moeller PS316 I/O cards) [1] |
|PEMX   |External memory box (EPROM bank) [2]                          |
|PMAN-IF|Manual control panel - interface module                       |
|PTAP   |Tape and speaker interface module [1]                         |

[1]: The circuit and software are currently under planning.  
[2]: The circuit are currently under construction.  
[3]: The software is currently under construction.

<hr>

## Hardware

In addition to the contents of the subdirectories, this description contains
all information that applies to the computer as a whole or to several cards
together.

README.md contains all textual information in the directory of self-designed
hardware elements, *description.pdf provides the same information in the
directory of purchased devices. In these, the README.md only contains the
current settings and information.

### Physical memory address table

The motherboard provides two Flash ROM sockets, enabling two firmware images to
be installed simultaneously; on the SC126, these typically contain the Small
Computer Monitor (SCM) in one device and RomWBW in the other.

The physical memory consists of 512 kB of Flash ROM at the lower half of the
address space and 512 kB of RAM at the upper half, with the Z180 memory
management unit mapping portions of this physical memory into the 64 kB logical
address space defined by the Z80/Z180 instruction set.

|From  |To    |Function              |
|-----:|-----:|----------------------|
|80000h|FFFFFh|RAM (512k bytes)      |
|00000h|7FFFFh|Flash ROM (512k bytes)|


### I/O address table

|From|To |Module|Function                                  |Note   |
|---:|--:|------|------------------------------------------|-------|
|00h |0Bh|      |                                          |       |
|0Ch |   |SC126 |system I/O port (RTC, SPI and I2C)        |       |
|0Dh |   |SC126 |LED output port                           |       |
|0Eh |0Fh|      |                                          |       |
|10h |17h|SC715 |CF module                                 |       |
|18h |2Fh|      |                                          |       |
|30h |   |SC719 |DIO for PIOI module                       |       |
|31h |   |PCOX  |Covox module                              |planned|
|32h |   |PTAP  |Tape and speaker interface                |planned|
|33h |67h|      |                                          |       |
|68h |6Bh|SC717 |PIO module                                |       |
|6Ch |7Fh|      |                                          |       |
|80h |83h|SC716 |SIO/2 module                              |       |
|84h |87h|      |                                          |       |
|88h |8Bh|SC718 |CTC module                                |       |
|8Ch |BFh|      |                                          |       |
|C0h |FFh|SC126 |Z180’s internal I/O registers             |       |


### IRQ table

|Number|Module|Function                          |Note         |
|:----:|------|----------------------------------|-------------|
|NMI   |      |                                  |             |
|INT0  |SC718 |timed interrupt                   |priority: 1st|
|INT1  |      |                                  |             |
|INT2  |      |                                  |             |


### BP80 extended bus

SC126 has 80-pin expansion sockets which are an extended RC2014 bus, known as
Backplane-80 (or BP80). This is an unofficial variant of the RC2014 Bus.

|Pin |Signal Name|Dir.|From-to         |Pin |Signal Name|Dir.|From-to      |
|---:|-----------|----|----------------|---:|-----------|----|-------------|
| 41 | n41       |    |not yet assigned|  1 | A15       | <- |CPU-A15      |
| 42 | n42       |    |not yet assigned|  2 | A14       | <- |CPU-A14      |
| 43 | n43       |    |not yet assigned|  3 | A13       | <- |CPU-A13      |
| 44 | n44       |    |not yet assigned|  4 | A12       | <- |CPU-A12      |
| 45 | n45       |    |not yet assigned|  5 | A11       | <- |CPU-A11      |
| 46 | n46       |    |not yet assigned|  6 | A10       | <- |CPU-A10      |
| 47 | n47       |    |not yet assigned|  7 | A9        | <- |CPU-A9       |
| 48 | n48       |    |not yet assigned|  8 | A8        | <- |CPU-A8       |
| 49 | A23       |    |not used        |  9 | A7        | <- |CPU-A7       |
| 50 | A22       |    |not used        | 10 | A6        | <- |CPU-A6       |
| 51 | A21       |    |not used        | 11 | A5        | <- |CPU-A5       |
| 52 | A20       |    |not used        | 12 | A4        | <- |CPU-A4       |
| 53 | A19       | <- |CPU-A19         | 13 | A3        | <- |CPU-A3       |
| 54 | A18       | <- |CPU-A18_Tout    | 14 | A2        | <- |CPU-A2       |
| 55 | A17       | <- |CPU-A19         | 15 | A1        | <- |CPU-A1       |
| 56 | A16       | <- |CPU-A19         | 16 | A0        | <- |CPU-A0       |
| 57 | GND       | -  |power supply    | 17 | GND       | -  |power supply |
| 58 | +5V       | <- |power supply    | 18 | +5V       | <- |power supply |
| 59 | /RFSH     | <- |CPU-/RFSH       | 19 | /M1       | <- |/M1          |
| 60 | PAGE      |    |not used        | 20 | /RESET    | <- |reset circuit|
| 61 | CLK2      |    |not used        | 21 | CLK       | <- |CPU-PHI      |
| 62 | /BUSAK    | <- |CPU-/BUSACK     | 22 | /INT      | -> |CPU-/INT0    |
| 63 | /HALT     | <- |CPU-/HALT       | 23 | /MREQ     | <- |CPU-/MEMRQ   |
| 64 | /BUSRQ    | -> |CPU-/BUSREQ     | 24 | /WR       | <- |CPU-/WR      |
| 65 | /WAIT     | -> |CPU-/WAIT       | 25 | /RD       | <- |CPU-/RD      |
| 66 | /NMI      |    |CPU-/NMI        | 26 | /IORQ     | <- |CPU-/IORQ    |
| 67 | D8        |    |not used        | 27 | D0        | <->|CPU-D0       |
| 68 | D9        |    |not used        | 28 | D1        | <->|CPU-D1       |
| 69 | D10       |    |not used        | 29 | D2        | <->|CPU-D2       |
| 70 | D11       |    |not used        | 30 | D3        | <->|CPU-D3       |
| 71 | D12       |    |not used        | 31 | D4        | <->|CPU-D4       |
| 72 | D13       |    |not used        | 32 | D5        | <->|CPU-D5       |
| 73 | D14       |    |not used        | 33 | D6        | <->|CPU-D6       |
| 74 | D15       |    |not used        | 34 | D7        | <->|CPU-D7       |
| 75 | TX2       | <- |CPU-TXA1        | 35 | TX        | <- |CPU-TXA0     |
| 76 | RX2       | -> |CPU-RXA1        | 36 | RX        | -> |CPU-RXA0     |
| 77 | USER5     |    |not used        | 37 | USER1     |    |not used     |
| 78 | USER6     |    |I2C SCL         | 38 | USER2     |    |not used     |
| 79 | USER7     |    |I2C SDA         | 39 | USER3     |    |not used     |
| 80 | USER8     |    |IEI             | 40 | USER4     |    |IEO          |


**USERn lines**  

USERn lines are the "free-to-use" lines of the RC2014 bus system. They were
created to keep the system flexible and allow users to add features that are
not part of the standard according to their individual needs.

_On the motherboard:_  

|Pin|Signal Name|SC126      |
|--:|-----------|-----------|
| 37|USER1      |           |
| 38|USER2      |           |
| 39|USER2      |           |
| 40|USER4      |IEO        |
| 77|USER5      |           |
| 78|USER6      |I2C SCL [1]|
| 79|USER7      |I2C SDA [2]|
| 80|USER8      |IEI        |

Jumpering:  

[1]: SC126 JP5 close 1-2  
[2]: SC126 JP5 close 3-4  

_On the backplane:_  

The SC-702 backplane forwards all lines straight with basic jumpering,
but if necessary, daisy-chain interrupt lines can be created
[using the USER lines](hardware/RCBus/bus_connection.pdf).


_On expansion cards:_  

|Pin|Signal Name|SC715|SC716  |SC717  |SC718     |SC719|PCOX|
|--:|-----------|-----|-------|-------|----------|-----|----|
| 37|USER1      |     |       |       |/INT1 [8] |     |    |
| 38|USER2      |     |IEI [4]|IEI [6]|IEI [9]   |     |    |
| 39|USER2      |     |IEO [5]|IEO [7]|IEO [10]  |     |    |
| 40|USER4      |     |       |       |          |     |    |
| 77|USER5      |     |       |       |/INT2 [11]|     |    |
| 78|USER6      |     |       |       |          |     |    |
| 79|USER7      |     |       |       |          |     |    |
| 80|USER8      |     |       |       |          |     |    |

Jumpering:  

[4]: SC716 JP8 close 1-2  
[5]: SC716 JP9 close 1-2  
[6]: SC717 JP2 close 1-2  
[7]: SC717 JP3 close 1-2  
[8]: SC718 JP9 close 1-2  
[9]: SC718 JP8 close 1-2  
[10]: SC718 JP7 close 1-2  
[11]: SC718 JP10 close 1-2  


**Other lines** 

|Pin|Signal Name|User function                    |
|--:|-----------|---------------------------------|
| 61|CLK2       |Speaker signal SC718/CTC2 -> PTAP|
| 75|TX2        |Serial data  SC126 -> PTAP       |
| 76|RX2        |Serial data  SC126 <- PTAP       |


### Modules in the expansion sockets

|Unit       |Socket|Modul |Function                                  |Note   |
|-----------|------|------|------------------------------------------|-------|
|motherboard|  S2  |PCOX  |Covox module                              |planned|
|motherboard|  S3  |PMAN  |manual programming unit's interface module|planned|
|backplane  |  K1  |SC718 |CTC module                                |       |
|backplane  |  K2  |SC716 |SIO/2 module                              |       |
|backplane  |  K3  |SC719 |DIO for PIOI module                       |       |
|backplane  |  K4  |SC719 |PTAP module                               |planned|
|backplane  |  K5  |PANA  |analog I/O module                         |planned|
|backplane  |  K6  |SC717 |PIO module                                |       |
|backplane  |  P1  |SC715 |CF module                                 |       |

The order is important because of daisy-chain interrupt handling.

<hr>

## Software

README.md contains all textual information in the subdirectories.
