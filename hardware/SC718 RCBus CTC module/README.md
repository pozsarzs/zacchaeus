# Zacchaeus Microcomputer

## Hardware/SC718 RCBus CTC module

### Directory content

|file                                    |description                               |
|----------------------------------------|------------------------------------------|
|SC718 description.pdf                   |detailed description                      |
|SC718 kit contents.pdf                  |contents of the kit available for purchase|
|SC718 schematic.pdf                     |schematic drawing                         |
|SC718_v1.0.1_2023-05-26_16-41_Gerber.zip|Gerber files for manufacturing            |


### About module

This is a commercially available expansion card designed by Stephen C. Cousins.
You can find the details in the original PDF files.


### Jumper settings

|Module|Num |Sign|Function                        |State   |Note|
|------|:--:|----|--------------------------------|:------:|----|
|SC718 |JP1 |A7-0|I/O address                     |10001000|    |
|SC718 |JP2 |CLK |CTC0 clock source: system clock |closed  |    |
|      |    |CLK2|CTC0 clock source: CLK2         |opened  |    |
|      |    |CLKX|CTC0 clock source: X1 oscillator|opened  |    |
|      |    |INT1|CTC0 clock source: INT1         |opened  |    |
|      |    |INT2|CTC0 clock source: INT2         |opened  |    |
|SC718 |JP3 |CLK |CTC1 clock source: system clock |closed  |    |
|      |    |CLK2|CTC1 clock source: CLK2         |opened  |    |
|      |    |CLKX|CTC1 clock source: X1 oscillator|opened  |    |
|      |    |INT1|CTC1 clock source: INT1         |opened  |    |
|      |    |INT2|CTC1 clock source: INT2         |opened  |    |
|SC718 |JP4 |CLK |CTC2 clock source: system clock |closed  |    |
|      |    |CLK2|CTC2 clock source: CLK2         |opened  |    |
|      |    |CLKX|CTC2 clock source: X1 oscillator|opened  |    |
|      |    |INT1|CTC2 clock source: INT1         |opened  |    |
|      |    |INT2|CTC2 clock source: INT2         |opened  |    |
|SC718 |JP5 |CLK |CTC3 clock source: system clock |closed  |    |
|      |    |CLK2|CTC3 clock source: CLK2         |opened  |    |
|      |    |CLKX|CTC3 clock source: X1 oscillator|opened  |    |
|      |    |INT1|CTC3 clock source: INT1         |opened  |    |
|      |    |ZT0 |CTC3 clock source: CTC2 output  |opened  |    |
|SC718 |JP6 |ZT0 |CLK2 source: CTC0 output        |closed  |    |
|      |    |ZT1 |CLK2 source: CTC1 output        |opened  |    |
|      |    |ZT2 |CLK2 source: CTC2 output        |opened  |    |
|      |    |CLKX|CLK2 source: X1 oscillator      |opened  |    |
|      |    |CLX |CLK2 source: system clock       |opened  |    |
|SC718 |JP7 |IEI |daisy-chain interrupt line      |closed  |    |
|SC718 |JP8 |IEO |daisy-chain interrupt line      |closed  |    |
|SC718 |JP9 |INT1|interrupt line                  |opened  |    |
|SC718 |JP10|INT2|interrupt line                  |opened  |    |


### Connection with others

The first channel of the CTC module is connected to the DB9 connector on the
back panel. The wiring can be found in the PBKP wiring diagram.


### Softwares

The CTC module does not have its own software.
