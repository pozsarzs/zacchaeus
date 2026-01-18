# Zacchaeus Microcomputer

## EBE-206.1 digital input module

> [!NOTE]
> This document is an independent, reverse-engineered description of this module
> It is not affiliated with, endorsed by, or derived from official manufacturer
> documentation.
>

### About module

_There are no position numbers or other markings printed on the panel._  

The 16 inputs are isolated by optocouplers. If the card address on the card
address lines and the DIP switch match, the card sets the DI output to match the
input specified on the DSn lines. The card only uses an internal +5V power
supply. 


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
| 6a|N.C.                |        |        |                   |
| 8a|N.C.                |        |        |                   |
|10a|N.C.                |        |        |                   |
|12a|DIn status          |  --->  |  DI    |                   |
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
