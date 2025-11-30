# Wiring table

## Wiring between moduls and back panel connectors

### CTC port wire

|unit #1         |connector|pin|w|pin|unit #2      |function|note|
|----------------|---------|--:|-|--:|-------------|--------|----|
|SC718 CTC module|P2       |  1|—|  4|DB9 connector|+5V     |    |
|                |         |  2|—|  2|             |CT0     |    |
|                |         |  3|—|  3|             |ZT0     |    |
|                |         | 10|—|  5|             |GND     |    |


## Paralel port wires

|unit #1         |connector |pin|w|pin|unit #2       |function|note      |
|----------------|----------|--:|-|--:|--------------|--------|----------|
|SC717 PIO module|P3A1, P3B1|  1| |   |DB25 connector|+5V     |          |
|                |          |  2|—|  2|              |P0      |          |
|                |          |  3|—|  3|              |P1      |          |
|                |          |  4|—|  4|              |P2      |          |
|                |          |  5|—|  5|              |P3      |          |
|                |          |  6|—|  6|              |P4      |          |
|                |          |  7|—|  7|              |P5      |          |
|                |          |  8|—|  8|              |P6      |          |
|                |          |  9|—|  9|              |P7      |          |
|                |          | 10|—| 18|              |P7      |pins 19-25|
|                |P3A2, P3B2|  1|—|  1|              |RDY     |          |
|                |P3A2, P3B2|  2|—| 10|              |-STB    |          |


## Serial port wires

|unit #1         |connector     |pin|w|pin|unit #2         |function|note        |
|----------------|--------------|--:|-|--:|----------------|--------|------------|
|SC126 main board|P5/P15, P6/P16|  1|—|  5|DB9 connector   |GND     |            |
|                |              |  2|—|  7|                |RTS     |            |
|                |              |  3|—|  4|                |DTR     |close P4, P7|
|                |              |  4|—|  2|                |RXD     |            |
|                |              |  5|—|  3|                |TXD     |            |
|                |              |  6|—|  8|                |CTS     |            |
|                |              |   | |   |                |        |            |
|SC126 main board|P5/P15, P6/P16|  1|—|  7|DB25 connector  |GND     |            |
|                |              |  2|—|  4|                |RTS     |            |
|                |              |  3|—| 20|                |DTR     |close P4, P7|
|                |              |  4|—|  3|                |RXD     |            |
|                |              |  5|—|  2|                |TXD     |            |
|                |              |  6|—|  5|                |CTS     |            |
|                |              |   | |   |                |        |            |
|SC126 main board|P5/P15, P6/P16|  1|—|  2|MCS-51MD shifter|GND     |            |
|                |              |  2| |   |                |RTS     |            |
|                |              |  3|—|  1|                |+5V     |close P4, P7|
|                |              |  4|—|  4|                |RXD     |            |
|                |              |  5|—|  3|                |TXD     |            |
|                |              |  6| |   |                |CTS     |            |
