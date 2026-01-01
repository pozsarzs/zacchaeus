# Zacchaeus Microcomputer

## Jumper settings

|Module|Num |Sign|Function                              |State      |Note  |
|------|:--:|----|--------------------------------------|:---------:|------|
|PIOI  |JP1 |    |TTL level type +5V                    |closed     |      |
|      |JP2 |    |TTL level type +3.3V                  |opened     |      |
|SC126 |JP1 |    |ROMWBW write protect                  |1-2 closed |      |
|      |JP2 |    |SCM S6 write protect                  |1-2 closed |      |
|      |JP3 |    |flash select                          |2-3 closed |      |
|      |JP4 |    |DCD0/DREQ1 select                     |1-2 closed |      |
|      |JP5 |    |I<sup>2<sup>C to bus socket           |all opened |      |
|      |P4  |    |+5 V to serial connector P5           |closed     |      |
|      |P7  |    |+5 V to serial connector P6           |closed     |      |
|SC702 |JP1 |    |connect P37 signal between bus sockets|1-2 closed |direct|
|      |JP1 |    |connect P38 signal between bus sockets|  4-       |      |
|      |JP1 |    |connect P39 signal between bus sockets|  6 closed |      |
|      |JP2 |    |connect TX signal between bus sockets |1-2 closed |direct|
|      |JP2 |    |connect RX signal between bus sockets |3-4 closed |direct|
|      |JP2 |    |connect P37 signal between bus sockets|5-6 closed |direct|
|      |JP2 |    |connect P38 signal between bus sockets|  8-       |      |
|      |JP2 |    |connect P39 signal between bus sockets| 10 closed |      |
|      |JP3 |    |connect P37 signal between bus sockets|1-2 closed |direct|
|      |JP3 |    |connect P38 signal between bus sockets|3-4 closed |direct|
|      |JP3 |    |connect P39 signal between bus sockets|5-6 closed |direct|
|      |JP4 |    |connect TX signal between bus sockets |1-2 closed |direct|
|      |JP4 |    |connect RX signal between bus sockets |3-4 closed |direct|
|      |JP4 |    |connect P37 signal between bus sockets|5-6 closed |direct|
|      |JP4 |    |connect P38 signal between bus sockets|7-8 closed |direct|
|      |JP4 |    |connect P39 signal between bus sockets|9-10 closed|direct|
|      |JP5 |    |connect P37 signal between bus sockets|1-2 closed |direct|
|      |JP5 |    |connect P38 signal between bus sockets|3-4 closed |direct|
|      |JP5 |    |connect P39 signal between bus sockets|5-6 closed |direct|
|      |JP6 |    |connect P42 signal between bus sockets|1-2 closed |direct|
|      |JP6 |    |connect P43 signal between bus sockets|3-4 closed |direct|
|      |JP6 |    |connect P44 signal between bus sockets|5-6 closed |direct|
|      |JP7 |    |connect P42 signal between bus sockets|1-2 closed |direct|
|      |JP7 |    |connect P43 signal between bus sockets|3-4 closed |direct|
|      |JP7 |    |connect P44 signal between bus sockets|5-6 closed |direct|
|      |JP8 |    |connect P42 signal between bus sockets|1-2 closed |direct|
|      |JP8 |    |connect P43 signal between bus sockets|3-4 closed |direct|
|      |JP8 |    |connect P44 signal between bus sockets|5-6 closed |direct|
|      |JP9 |    |connect P42 signal between bus sockets|1-2 closed |direct|
|      |JP9 |    |connect P43 signal between bus sockets|3-4 closed |direct|
|      |JP9 |    |connect P44 signal between bus sockets|5-6 closed |direct|
|      |JP10|    |connect P42 signal between bus sockets|1-2 closed |direct|
|      |JP10|    |connect P43 signal between bus sockets|3-4 closed |direct|
|      |JP10|    |connect P44 signal between bus sockets|5-6 closed |direct|
|SC716 |JP1 |A7-0|I/O address                           |10000000   |      | 
|      |JP2 |    |clock source for port A (CLK2/X1 osc.)|2-3 closed |      |
|      |JP3 |    |clock source for port B (CLK2/X1 osc.)|2-3 closed |      |
|      |JP4 |    |connect bus TX to TXA/TXB             |all opened |      |
|      |JP5 |    |connect bus RX to RXA/RXB             |all opened |      |
|      |JP6 |    |connect bus TX2 to TXA/TXB            |all opened |      |
|      |JP7 |    |connect bus RX2 to RXA/RXB            |all opened |      |
|      |JP8 |IEI |daisy-chain interrupt line            |closed     |      |
|      |JP9 |IEO |daisy-chain interrupt line            |closed     |      |
|      |JP10|    |+5 V to serial connector A            |opened     |      |
|      |JP11|    |+5 V to serial connector B            |opened     |      |
|SC717 |JP1 |A7-0|I/O address                           |01101000   |      |
|      |JP2 |IEI |daisy-chain interrupt line            |closed     |      |
|      |JP3 |IEO |daisy-chain interrupt line            |closed     |      |
|SC718 |JP1 |A7-0|I/O address                           |10001000   |      |
|      |JP2 |CLK |CTC0 clock source: system clock       |closed     |      |
|      |    |CLK2|CTC0 clock source: CLK2               |opened     |      |
|      |    |CLKX|CTC0 clock source: X1 oscillator      |opened     |      |
|      |    |INT1|CTC0 clock source: INT1               |opened     |      |
|      |    |INT2|CTC0 clock source: INT2               |opened     |      |
|      |JP3 |CLK |CTC1 clock source: system clock       |closed     |      |
|      |    |CLK2|CTC1 clock source: CLK2               |opened     |      |
|      |    |CLKX|CTC1 clock source: X1 oscillator      |opened     |      |
|      |    |INT1|CTC1 clock source: INT1               |opened     |      |
|      |    |INT2|CTC1 clock source: INT2               |opened     |      |
|      |JP4 |CLK |CTC2 clock source: system clock       |closed     |      |
|      |    |CLK2|CTC2 clock source: CLK2               |opened     |      |
|      |    |CLKX|CTC2 clock source: X1 oscillator      |opened     |      |
|      |    |INT1|CTC2 clock source: INT1               |opened     |      |
|      |    |INT2|CTC2 clock source: INT2               |opened     |      |
|      |JP5 |CLK |CTC3 clock source: system clock       |closed     |      |
|      |    |CLK2|CTC3 clock source: CLK2               |opened     |      |
|      |    |CLKX|CTC3 clock source: X1 oscillator      |opened     |      |
|      |    |INT1|CTC3 clock source: INT1               |opened     |      |
|      |    |ZT0 |CTC3 clock source: CTC2 output        |opened     |      |
|      |JP6 |ZT0 |CLK2 source: CTC0 output              |closed     |      |
|      |    |ZT1 |CLK2 source: CTC1 output              |opened     |      |
|      |    |ZT2 |CLK2 source: CTC2 output              |opened     |      |
|      |    |CLKX|CLK2 source: X1 oscillator            |opened     |      |
|      |    |CLX |CLK2 source: system clock             |opened     |      |
|      |JP7 |IEI |daisy-chain interrupt line            |closed     |      |
|      |JP8 |IEO |daisy-chain interrupt line            |closed     |      |
|      |JP9 |INT1|interrupt line                        |opened     |      |
|      |JP10|INT2|interrupt line                        |opened     |      |
|SC719 |JP1 |A7-0|I/O address                           |00001011   |      |
