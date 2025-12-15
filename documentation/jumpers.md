# Zacchaeus Microcomputer

## Jumper settings

|Module|Num |Sign|Function                       |State   |Note |
|------|:--:|----|-------------------------------|:------:|-----|
|PCOX  |JP1 |A7-0|I/O address                    |00001110|     |
|PIOI  |JP1 |    |TTL level type +5V             |1       |     |
|      |JP2 |    |TTL level type +3.3V           |0       |     |
|SC717 |JP1 |A7-0|I/O address                    |01101000|     |
|      |JP2 |IEI |daisy-chain interrupt line     |0       |     |
|      |JP3 |IEO |daisy-chain interrupt line     |0       |     |
|SC718 |JP1 |A7-0|I/O address                    |10001000|     |
|      |JP2 |CLK |CTC0 clock source: system clock|1       |     |
|      |    |CLK2|CTC0 clock source: CLK2        |0       |     |
|      |    |CLKX|CTC0 clock source: X1 osc.     |0       |     |
|      |    |INT1|CTC0 clock source: INT1        |0       |     |
|      |    |INT2|CTC0 clock source: INT2        |0       |     |
|      |JP3 |CLK |CTC1 clock source: system clock|1       |     |
|      |    |CLK2|CTC1 clock source: CLK2        |0       |     |
|      |    |CLKX|CTC1 clock source: X1 osc.     |0       |     |
|      |    |INT1|CTC1 clock source: INT1        |0       |     |
|      |    |INT2|CTC1 clock source: INT2        |0       |     |
|      |JP4 |CLK |CTC2 clock source: system clock|1       |     |
|      |    |CLK2|CTC2 clock source: CLK2        |0       |     |
|      |    |CLKX|CTC2 clock source: X1 osc.     |0       |     |
|      |    |INT1|CTC2 clock source: INT1        |0       |     |
|      |    |INT2|CTC2 clock source: INT2        |0       |     |
|      |JP5 |CLK |CTC3 clock source: system clock|1       |     |
|      |    |CLK2|CTC3 clock source: CLK2        |0       |     |
|      |    |CLKX|CTC3 clock source: X1 osc.     |0       |     |
|      |    |INT1|CTC3 clock source: INT1        |0       |     |
|      |    |ZT0 |CTC3 clock source: CTC2 output |0       |     |
|      |JP6 |ZT0 |CLK2 source: CTC0 output       |1       |     |
|      |    |ZT1 |CLK2 source: CTC1 output       |0       |     |
|      |    |ZT2 |CLK2 source: CTC2 output       |0       |     |
|      |    |CLKX|CLK2 source: X1 osc.           |0       |     |
|      |    |CLX |CLK2 source: system clock      |0       |     |
|      |JP7 |IEI |daisy-chain interrupt line     |0       |     |
|      |JP8 |IEO |daisy-chain interrupt line     |0       |     |
|      |JP9 |INT1|interrupt line                 |0       |     |
|      |JP10|INT2|interrupt line                 |0       |     |
|SC719 |JP1 |A7-0|I/O address                    |00001011|     |

(
 SC126 Z180 motherboard
 SC702 RCBus backplane
 SC716 RCBus SIO-2 module
)
