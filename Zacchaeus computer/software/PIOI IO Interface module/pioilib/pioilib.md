# Zacchaeus Microcomputer

## PIOI routine collection

|Key         |Value                                             |
|------------|--------------------------------------------------|
|version     |v0.1                                              |
|licence     |EUPL v1.2                                         |
|architecture|Z80                                               |
|OS          |CP/M-80                                           |
|compiler    |SLR Systems Z80ASM v1.32 (1986)                   |
|author      |[Pozsar Zsolt](mailto:pozsarzs@gmail.com) (2025)  |
|web         |[Pozsi's homepage](https://www.pozsarzs.hu)       |
|            |[on Github](https://github.com/pozsarzs/zacchaeus)|

This is a collection of routines for easy management of PIOI interface ports.

### Available functions

|A      |B      |C   |Function                                    |Return (A)|
|:-----:|:-----:|:--:|--------------------------------------------|:--------:|
|address|N/A    |00h |set address                                 |N/A       |
|N/A    |N/A    |01h |get address                                 |address   |
|N/A    |N/A    |02h |reset all OCOs and RCOs                     |N/A       |
|N/A    |N/A    |03h |reset all OCOs                              |N/A       |
|N/A    |N/A    |04h |reset all RCOs                              |N/A       |
|       |       |    |                                            |          |
|N/A    |N/A    |10h |read data from all PIs                      |data      |
|N/A    |mask   |11h |masked read data from all PIs               |data      |
|N/A    |mask   |12h |masked change checking of all PIs           |state     |
|N/A    |portnum|18h |read state from a PI                        |state     |
|       |       |    |                                            |          |
|data   |N/A    |20h |write data to all OCOs                      |N/A       |
|data   |mask   |21h |masked write data to all OCOs               |N/A       |
|N/A    |portnum|28h |switch on a OCO port                        |N/A       |
|N/A    |portnum|29h |switch off a OCO port                       |N/A       |
|delay  |portnum|2Ah |switch on and delayed off a OCO port        |N/A       |
|       |       |    |                                            |          |
|data   |N/A    |30h |write data to all RCOs                      |N/A       |
|data   |mask   |31h |masked write data to all RCOs               |N/A       |
|N/A    |portnum|38h |switch on a RCO port                        |N/A       |
|N/A    |portnum|39h |switch off a RCO port                       |N/A       |
|delay  |portnum|3Ah |switch on and delayed off a RCO port        |N/A       |

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
