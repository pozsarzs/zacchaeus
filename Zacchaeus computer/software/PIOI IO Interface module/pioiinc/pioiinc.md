# Zacchaeus Microcomputer

## PIOI routine collection

|Key         |Value                                             |
|------------|--------------------------------------------------|
|version     |v0.1                                              |
|licence     |EUPL v1.2                                         |
|architecture|Z80                                               |
|OS          |CP/M-80                                           |
|compiler    |Borland Turbo Pascal v3.01A (1985)                |
|author      |[Pozsar Zsolt](mailto:pozsarzs@gmail.com) (2025)  |
|web         |[Pozsi's homepage](https://www.pozsarzs.hu)       |
|            |[on Github](https://github.com/pozsarzs/zacchaeus)|

This is a collection of routines for easy management of PIOI interface ports.

### Available procedures and functions

|Name                                       |Function                       |Result|
|-------------------------------------------|-------------------------------|:----:|
|`procedure setioaddr(address: byte);`      |set i/o address                |N/A   |
|`function getioaddr: byte;`                |get i/o address                |byte  |
|`procedure resetall;`                      |reset all OCOs and RCOs        |N/A   |
|`procedure resetoco;`                      |reset all OCOs                 |N/A   |
|`procedure resetrco;`                      |reset all RCOs                 |N/A   |
|                                           |                               |      |
|`function readallpi: byte;`                |read data from all PIs         |byte  |
|`function maskreadpi(mask: byte): byte;`   |masked read data from PIs      |byte  |
|`function checkpi(mask: byte): byte;`      |masked change checking of PIs  |byte  |
|`function readpi(portnum: byte): byte;`    |read state from a PI           |byte  |
|                                           |                               |      |
|`procedure writeoco(data: byte);`          |write data to all OCOs         |N/A   |
|`procedure maskwriteoco(data, mask: byte);`|masked write data to all OCOs  |N/A   |
|`procedure onoco(portnum: byte);`          |switch on a OCO port           |N/A   |
|`procedure offoco(portnum: byte);`         |switch off a OCO port          |N/A   |
|`procedure pulseoco(delay, portnum: byte);`|switch on and delayed off a OCO|N/A   |
|                                           |                               |      |
|`procedure writerco(data: byte);`          |write data to all RCOs         |N/A   |
|`procedure maskwriterco(data, mask: byte);`|masked write data to all RCOs  |N/A   |
|`procedure onrco(portnum: byte);`          |switch on a RCO port           |N/A   |
|`procedure offrco(portnum: byte);`         |switch off a RCO port          |N/A   |
|`procedure pulserco(delay, portnum: byte);`|switch on and delayed off a RCO|N/A   |

**Notes:**  
  - _address:_ i/o address of interface [00..FFh]
  - _data:_ half byte [00..0Fh]
  - _PI:_ Protected Input
  - _portnum:_ number of port [0..3]
  - _OCO:_ Open Collector Output
  - _RCO:_ Relay Contact Output
  - _state:_ bit [00h/FFh]

### Ports

  - _-PI0:_ D0 and D1 bits (equal and inverted)
  - _-PI1:_ D2 and D3 bits (equal and inverted)
  - _-PI2:_ D4 and D5 bits (equal and inverted)
  - _-PI3:_ D6 and D7 bits (equal and inverted)
  - _OCO0:_ D0 bit
  - _OCO1:_ D1 bit
  - _OCO2:_ D2 bit
  - _OCO3:_ D3 bit
  - _RCO0:_ D4 bit
  - _RCO1:_ D5 bit
  - _RCO2:_ D6 bit
  - _RCO3:_ D7 bit
