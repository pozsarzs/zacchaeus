# Zacchaeus Microcomputer

## EBE-266.1 digital output module

> [!NOTE]
> This document is an independent, reverse-engineered description of this module
> It is not affiliated with, endorsed by, or derived from official manufacturer
> documentation.
>

### About module

_There are no position numbers or other markings printed on the panel._  

The external voltage is switched to the 16 outputs by optocoupler-isolated
electronic switches. If the card address on the card address lines and the DIP
switch match, the card sets the output specified on the DSn lines to match the
DO line. The status of the outputs can be reset from the bus and with an
external push button. The card uses internal +5V and external +24V power supply. 


### Jumper settings

The card address can be set using the 8-position DIP switch on the card.

|SW |Own sign|Function    |Note|
|--:|:------:|------------|----|
| 1 |'DA0    |card address|    |
| 2 |'DA1    |card address|    |
| 3 |'DA2    |card address|    |
| 4 |'DA3    |card address|    |
| 5 |'DA4    |card address|    |
| 6 |'DA5    |card address|    |
| 7 |        |N.C.        |    |
| 8 |        |N.C.        |    |

'DAn switches == DAn lines.


### Connection with bus

|Pin|Function            |card-CPU|Own sign|Note               |
|--:|--------------------|:------:|:------:|-------------------|
| 2a|GND                 |        |        |                   |
| 4a|+5V                 |        |        |                   |
| 6a|DOn status          |  <---  |  D0    |                   |
| 8a|/card not selected  |  --->  |  /NS   |                   |
|10a|/reset              |  <---  |  /RES  |                   |
|12a|N.C.                |        |        |                   |
|14a|card address line   |  <---  |  DA5   |                   |
|16a|card address line   |  <---  |  DA4   |                   |
|18a|card address line   |  <---  |  DA3   |                   |
|20a|card address line   |  <---  |  DA2   |                   |
|22a|card address line   |  <---  |  DA1   |                   |
|24a|card address line   |  <---  |  DA0   |                   |
|26a|select mux/demux    |  <---  |  DS3   |L/H: DI0..7/DI8..15|
|28a|mux/demux selector A|  <---  |  DS0   |                   |
|30a|mux/demux selector B|  <---  |  DS1   |                   |
|32a|mux/demux selector C|  <---  |  DS2   |                   |


### Softwares

This module does not have its own software. Its operation was ensured by the
CPU module of the original system.
