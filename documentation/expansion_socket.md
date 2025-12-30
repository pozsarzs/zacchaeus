# Zacchaeus Microcomputer

## BP80 extended bus

SC126 has 80-pin expansion sockets which are an extended RC2014 bus, known as
Backplane-80 (or BP80). This is an unofficial variant of the RC2014 Bus.

|Pin |Signal Name|Dir.|From-to         |Pin |Signal Name|Dir.|From-to         |
|---:|-----------|----|----------------|---:|-----------|----|----------------|
| 41 | n41       |    |not yet assigned|  1 | A15       | <- |CPU-A15         |
| 42 | n42       |    |not yet assigned|  2 | A14       | <- |CPU-A14         |
| 43 | n43       |    |not yet assigned|  3 | A13       | <- |CPU-A13         |
| 44 | n44       |    |not yet assigned|  4 | A12       | <- |CPU-A12         |
| 45 | n45       |    |not yet assigned|  5 | A11       | <- |CPU-A11         |
| 46 | n46       |    |not yet assigned|  6 | A10       | <- |CPU-A10         |
| 47 | n47       |    |not yet assigned|  7 | A9        | <- |CPU-A9          |
| 48 | n48       |    |not yet assigned|  8 | A8        | <- |CPU-A8          |
| 49 | A23       |    |not used        |  9 | A7        | <- |CPU-A7          |
| 50 | A22       |    |not used        | 10 | A6        | <- |CPU-A6          |
| 51 | A21       |    |not used        | 11 | A5        | <- |CPU-A5          |
| 52 | A20       |    |not used        | 12 | A4        | <- |CPU-A4          |
| 53 | A19       | <- |CPU-A19         | 13 | A3        | <- |CPU-A3          |
| 54 | A18       | <- |CPU-A18_Tout    | 14 | A2        | <- |CPU-A2          |
| 55 | A17       | <- |CPU-A19         | 15 | A1        | <- |CPU-A1          |
| 56 | A16       | <- |CPU-A19         | 16 | A0        | <- |CPU-A0          |
| 57 | GND       | -  |power supply    | 17 | GND       | -  |power supply    |
| 58 | +5V       | <- |power supply    | 18 | +5V       | <- |power supply    |
| 59 | /RFSH     | <- |CPU-/RFSH       | 19 | /M1       | <- |/M1             |
| 60 | PAGE      |    |not used        | 20 | /RESET    | <- |reset circuit   |
| 61 | CLK2      |    |not used        | 21 | CLK       | <- |CPU-PHI         |
| 62 | /BUSAK    | <- |CPU-/BUSACK     | 22 | /INT      | -> |CPU-/INT0       |
| 63 | /HALT     | <- |CPU-/HALT       | 23 | /MREQ     | <- |CPU-/MEMRQ      |
| 64 | /BUSRQ    | -> |CPU-/BUSREQ     | 24 | /WR       | <- |CPU-/WR         |
| 65 | /WAIT     | -> |CPU-/WAIT       | 25 | /RD       | <- |CPU-/RD         |
| 66 | /NMI      |    |CPU-/NMI        | 26 | /IORQ     | <- |CPU-/IORQ       |
| 67 | D8        |    |not used        | 27 | D0        | <->|CPU-D0          |
| 68 | D9        |    |not used        | 28 | D1        | <->|CPU-D1          |
| 69 | D10       |    |not used        | 29 | D2        | <->|CPU-D2          |
| 70 | D11       |    |not used        | 30 | D3        | <->|CPU-D3          |
| 71 | D12       |    |not used        | 31 | D4        | <->|CPU-D4          |
| 72 | D13       |    |not used        | 32 | D5        | <->|CPU-D5          |
| 73 | D14       |    |not used        | 33 | D6        | <->|CPU-D6          |
| 74 | D15       |    |not used        | 34 | D7        | <->|CPU-D7          |
| 75 | TX2       | <- |CPU-TXA1        | 35 | TX        | <- |CPU-TXA0        |
| 76 | RX2       | -> |CPU-RXA1        | 36 | RX        | -> |CPU-RXA0        |
| 77 | USER5     |    |not used        | 37 | USER1     |    |not used        |
| 78 | USER6     |    |I2C SCL         | 38 | USER2     |    |not used        |
| 79 | USER7     |    |I2C SDA         | 39 | USER3     |    |not used        |
| 80 | USER8     |    |IEI             | 40 | USER4     |    |IEO             |


## USERn lines

USERn lines are the "free-to-use" lines of the RC2014 bus system. They were
created to keep the system flexible and allow users to add features that are
not part of the standard according to their individual needs.


### On the motherboard

|Pin|Signal Name|SC126      |
|--:|-----------|-----------|
| 37|USER1      |           |
| 38|USER2      |           |
| 39|USER2      |           |
| 40|USER4      |IEO        |
| 77|USER5      |           |
| 78|USER6      |I2C SCL[^1]|
| 79|USER7      |I2C SDA[^2]|
| 80|USER8      |IEI        |


### Backplane

The SC-702 backplane forwards all lines straight with basic jumpering,
but if necessary, daisy-chain interrupt lines can be created using the
USER lines. For the drawing, see bus_connection.pdf.


### Expansion cards

|Pin|Signal Name|SC715|SC716  |SC717  |SC718     |SC719|PCOX|
|--:|-----------|-----|-------|-------|----------|-----|----|
| 37|USER1      |     |       |       |/INT1[^8] |     |    |
| 38|USER2      |     |IEI[^4]|IEI[^6]|IEI[^9]   |     |    |
| 39|USER2      |     |IEO[^5]|IEO[^7]|IEO[^10]  |     |    |
| 40|USER4      |     |       |       |          |     |    |
| 77|USER5      |     |       |       |/INT2[^11]|     |    |
| 78|USER6      |     |       |       |          |     |    |
| 79|USER7      |     |       |       |          |     |    |
| 80|USER8      |     |       |       |          |     |    |

### Jumpering
[^1]: SC126 JP5 close 1-2
[^2]: SC126 JP5 close 3-4
[^4]: SC716 JP8 close 1-2
[^5]: SC716 JP9 close 1-2
[^6]: SC717 JP2 close 1-2
[^7]: SC717 JP3 close 1-2
[^8]: SC718 JP9 close 1-2
[^9]: SC718 JP8 close 1-2
[^10]: SC718 JP7 close 1-2
[^11]: SC718 JP10 close 1-2
