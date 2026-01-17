# Zacchaeus Microcomputer

## EBE-206.1 digital input module

> [!NOTE]
> This document is an independent, reverse-engineered description of this module
> It is not affiliated with, endorsed by, or derived from official manufacturer
> documentation.
>

### About module



### Jumper settings



### Connection with others



#### Bus connector

|Pin|Function             |card-CPU|Own sign|Note               |
|---|---------------------|--------|--------|-------------------|
| 2a|GND                  |        |        |                   |
| 4a|+5V                  |        |        |                   |
| 6a|N.C.                 |        |        |                   |
| 8a|N.C.                 |        |        |                   |
|10a|N.C.                 |        |        |                   |
|12a|DIn status           |  --->  |  DI    |                   |
|14a|card address 5 == SW6|  <---  |  DA5   |                   |
|16a|card address 4 == SW5|  <---  |  DA4   |                   |
|18a|card address 3 == SW4|  <---  |  DA3   |                   |
|20a|card address 2 == SW3|  <---  |  DA2   |                   |
|22a|card address 1 == SW2|  <---  |  DA1   |                   |
|24a|card address 0 == SW1|  <---  |  DA0   |                   |
|26a|select mux/demux     |  <---  |  DS3   |L/H: DI0..7/DI8..15|
|28a|mux/demux selector A |  <---  |  DS0   |                   |
|30a|mux/demux selector B |  <---  |  DS1   |                   |
|32a|mux/demux selector C |  <---  |  DS2   |                   |


### Softwares

This module does not have its own software. Its operation was ensured by the
CPU module of the original system.
