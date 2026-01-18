# Zacchaeus Microcomputer

## EBE-287.1 analog output module

> [!NOTE]
> This document is an independent, reverse-engineered description of this module
> It is not affiliated with, endorsed by, or derived from official manufacturer
> documentation.
>

### About module

_There are no position numbers or other markings printed on the panel._  

The module consists of two main parts: the analog and the digital panel.

The analog panel has two additional components that determine the type of
output signal. The tested model has two AQM61.2 types, which can produce
-10..+10V in 12-bit resolution.

The digital board is a circuit built from traditional TTL and PAL circuits
that controls the D/A converters on the analog board. The control of analog
I/O modules is completely different from that of digital ones.

(..)

The card uses internal +5V and external +24V power supply. 


### Jumper settings

The module contains a jumper, the right two of which are connected together.
Below these, you can read the letter E. Its function is unknown.


### Connection with bus

|Pin|Function            |card-CPU|Own sign|Note                |
|--:|--------------------|:------:|:------:|--------------------|
| 2a|GND                 |        |        |                    |
| 4a|+5V                 |        |        |                    |
| 6a|N.C.                |        |        |                    |
| 8a|N.C.                |        |        |                    |
|10a|/reset              |  <---  |  /RES  |                    |
|12a|N.C.                |        |        |                    |
|14a|N.C.                |        |        |                    |
|16a|N.C.                |        |        |                    |
|18a|N.C.                |        |        |                    |
|20a|N.C.                |        |        |                    |
|22a|N.C.                |        |        |                    |
|24a|N.C.                |        |        |                    |
|26a|N.C.                |        |        |                    |
|28a|N.C.                |        |        |                    |
|30a|N.C.                |        |        |                    |
|32a|N.C.                |        |        |                    |
| 2b|                    |        |        |chained on backplane|
| 4b|                    |        |        |                    |
| 6b|                    |        |        |                    |
| 8b|                    |        |        |                    |
|10b|unknown             |  <---  |        |connect to LS244/15 |
|12b|unknown             |  --->  |        |connect to LS244/18 |
|14b|unknown             |  ?     |        |connect to PAL0310/1|
|16b|detect socket number|        |        |                    |
|18b|data 0              |  <-->  |  D0    |                    |
|20b|data 2              |  <-->  |  D2    |                    |
|22b|data 4              |  <-->  |  D4    |                    |
|24b|data 6              |  <-->  |  D6    |                    |
|26b|card address line   |  <---  |  DA0   |                    |
|28b|card address line   |  <---  |  DA2   |                    |
|30b|card address line   |  <---  |  DA4   |                    |
|32b|card address line   |  <---  |  DA6   |                    |
| 2z|                    |        |        |chained on backplane|
| 4z|                    |        |        |                    |
| 6z|                    |        |        |                    |
| 8z|                    |        |        |                    |
|10z|unknown             |  <---  |        |connect to LS244/11 |
|12z|unknown             |  <---  |        |connect to LS244/13 |
|14z|GND                 |        |        |                    |
|16z|detect socket number|        |        |                    |
|18z|data line           |  <-->  |  D1    |                    |
|20z|data line           |  <-->  |  D3    |                    |
|22z|data line           |  <-->  |  D5    |                    |
|24z|data line           |  <-->  |  D7    |                    |
|26z|card address line   |  <---  |  DA1   |                    |
|28z|card address line   |  <---  |  DA3   |                    |
|30z|card address line   |  <---  |  DA5   |                    |
|32z|card address line   |  <---  |  DA7   |                    |

**Notes**  

Chained on backplane:
```
  GND-S1/1z -> S1/1b-S2/1z -> S2/1b-S3/1z -> ... -> S8/1b-S9/1z
```


### Softwares

This module does not have its own software. Its operation was ensured by the
CPU module of the original system.
