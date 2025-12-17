# Zacchaeus Microcomputer

## Jumper settings

|Module|Num   |Sign|Function                              |State     |Note  |
|------|:----:|----|--------------------------------------|:--------:|------|
|PCOX  |JP1   |A7-0|I/O address                           |00001110  |      |
|PIOI  |JP1   |    |TTL level type +5V                    |1         |      |
|      |JP2   |    |TTL level type +3.3V                  |0         |      |
|SC126 |JP1   |    |ROMWBW write protect                  |1-2 closed|      |
|      |JP2   |    |SCM S6 write protect                  |1-2 closed|      |
|      |JP3   |    |flash select                          |2-3 closed|      |
|      |JP4   |    |DCD0/DREQ1 select                     |1-2 closed|      |
|      |JP5   |    |I<sup>2<sup>C to bus socket           |00        |      |
|      |P4    |    |+5 V to serial connector P5           |1         |      |
|      |P7    |    |+5 V to serial connector P6           |1         |      |
|SC702 |JP1/1 |    |connect P37 signal between bus sockets|1         |direct|
|      |JP1/2 |    |connect P38 signal between bus sockets|1         |direct|
|      |JP1/3 |    |connect P39 signal between bus sockets|1         |direct|
|      |JP2/1 |    |connect TX signal between bus sockets |1         |direct|
|      |JP2/2 |    |connect RX signal between bus sockets |1         |direct|
|      |JP2/3 |    |connect P37 signal between bus sockets|1         |direct|
|      |JP2/4 |    |connect P38 signal between bus sockets|1         |direct|
|      |JP2/5 |    |connect P39 signal between bus sockets|1         |direct|
|      |JP3/1 |    |connect P37 signal between bus sockets|1         |direct|
|      |JP3/2 |    |connect P38 signal between bus sockets|1         |direct|
|      |JP3/3 |    |connect P39 signal between bus sockets|1         |direct|
|      |JP4/1 |    |connect TX signal between bus sockets |1         |direct|
|      |JP4/2 |    |connect RX signal between bus sockets |1         |direct|
|      |JP4/3 |    |connect P37 signal between bus sockets|1         |direct|
|      |JP4/4 |    |connect P38 signal between bus sockets|1         |direct|
|      |JP4/5 |    |connect P39 signal between bus sockets|1         |direct|
|      |JP5/1 |    |connect P37 signal between bus sockets|1         |direct|
|      |JP5/2 |    |connect P38 signal between bus sockets|1         |direct|
|      |JP5/3 |    |connect P39 signal between bus sockets|1         |direct|
|      |JP6/1 |    |connect P42 signal between bus sockets|1         |direct|
|      |JP6/2 |    |connect P43 signal between bus sockets|1         |direct|
|      |JP6/3 |    |connect P44 signal between bus sockets|1         |direct|
|      |JP7/1 |    |connect P42 signal between bus sockets|1         |direct|
|      |JP7/2 |    |connect P43 signal between bus sockets|1         |direct|
|      |JP7/3 |    |connect P44 signal between bus sockets|1         |direct|
|      |JP8/1 |    |connect P42 signal between bus sockets|1         |direct|
|      |JP8/2 |    |connect P43 signal between bus sockets|1         |direct|
|      |JP8/3 |    |connect P44 signal between bus sockets|1         |direct|
|      |JP9/1 |    |connect P42 signal between bus sockets|1         |direct|
|      |JP9/2 |    |connect P43 signal between bus sockets|1         |direct|
|      |JP9/3 |    |connect P44 signal between bus sockets|1         |direct|
|      |JP10/1|    |connect P42 signal between bus sockets|1         |direct|
|      |JP10/2|    |connect P43 signal between bus sockets|1         |direct|
|      |JP10/3|    |connect P44 signal between bus sockets|1         |direct|
|SC716 |JP1   |A7-0|I/O address                           |10000000  |      | 
|      |JP2   |    |clock source for port A (CLK2/X1 osc.)|2-3 closed|      |
|      |JP3   |    |clock source for port B (CLK2/X1 osc.)|2-3 closed|      |
|      |JP4   |    |connect bus TX to TXA/TXB             |all opened|      |
|      |JP5   |    |connect bus RX to RXA/RXB             |all opened|      |
|      |JP6   |    |connect bus TX2 to TXA/TXB            |all opened|      |
|      |JP7   |    |connect bus RX2 to RXA/RXB            |all opened|      |
|      |JP8   |IEI |daisy-chain interrupt line            |0         |      |
|      |JP9   |IEO |daisy-chain interrupt line            |0         |      |
|      |JP10  |    |+5 V to serial connector A            |0         |      |
|      |JP11  |    |+5 V to serial connector B            |0         |      |
|SC717 |JP1   |A7-0|I/O address                           |01101000  |      |
|      |JP2   |IEI |daisy-chain interrupt line            |0         |      |
|      |JP3   |IEO |daisy-chain interrupt line            |0         |      |
|SC718 |JP1   |A7-0|I/O address                           |10001000  |      |
|      |JP2   |CLK |CTC0 clock source: system clock       |1         |      |
|      |      |CLK2|CTC0 clock source: CLK2               |0         |      |
|      |      |CLKX|CTC0 clock source: X1 oscillator      |0         |      |
|      |      |INT1|CTC0 clock source: INT1               |0         |      |
|      |      |INT2|CTC0 clock source: INT2               |0         |      |
|      |JP3   |CLK |CTC1 clock source: system clock       |1         |      |
|      |      |CLK2|CTC1 clock source: CLK2               |0         |      |
|      |      |CLKX|CTC1 clock source: X1 oscillator      |0         |      |
|      |      |INT1|CTC1 clock source: INT1               |0         |      |
|      |      |INT2|CTC1 clock source: INT2               |0         |      |
|      |JP4   |CLK |CTC2 clock source: system clock       |1         |      |
|      |      |CLK2|CTC2 clock source: CLK2               |0         |      |
|      |      |CLKX|CTC2 clock source: X1 oscillator      |0         |      |
|      |      |INT1|CTC2 clock source: INT1               |0         |      |
|      |      |INT2|CTC2 clock source: INT2               |0         |      |
|      |JP5   |CLK |CTC3 clock source: system clock       |1         |      |
|      |      |CLK2|CTC3 clock source: CLK2               |0         |      |
|      |      |CLKX|CTC3 clock source: X1 oscillator      |0         |      |
|      |      |INT1|CTC3 clock source: INT1               |0         |      |
|      |      |ZT0 |CTC3 clock source: CTC2 output        |0         |      |
|      |JP6   |ZT0 |CLK2 source: CTC0 output              |1         |      |
|      |      |ZT1 |CLK2 source: CTC1 output              |0         |      |
|      |      |ZT2 |CLK2 source: CTC2 output              |0         |      |
|      |      |CLKX|CLK2 source: X1 oscillator            |0         |      |
|      |      |CLX |CLK2 source: system clock             |0         |      |
|      |JP7   |IEI |daisy-chain interrupt line            |0         |      |
|      |JP8   |IEO |daisy-chain interrupt line            |0         |      |
|      |JP9   |INT1|interrupt line                        |0         |      |
|      |JP10  |INT2|interrupt line                        |0         |      |
|SC719 |JP1   |A7-0|I/O address                           |00001011  |      |
