# Wiring table

## Serial port wires

|unit #1         |connector     |pin| dir. |pin|unit #2         |function|note        |
|----------------|--------------|--:|:----:|--:|----------------|--------|------------|
|SC126 main board|P5/P15, P6/P16|  1|  —   |  5|DB9 connector   |GND     |            |
|                |              |  2|&rarr;|  7|                |RTS     |            |
|                |              |  3|&rarr;|  4|                |DTR/+5V |close P4, P7|
|                |              |  4|&larr;|  2|                |RXD     |            |
|                |              |  5|&rarr;|  3|                |TXD     |            |
|                |              |  6|&larr;|  8|                |CTS     |            |
|                |              |   |      |   |                |        |            |
|SC126 main board|P5/P15, P6/P16|  1|  —   |  7|DB25 connector  |GND     |            |
|                |              |  2|&rarr;|  4|                |RTS     |            |
|                |              |  3|&rarr;| 20|                |DTR/+5V |close P4, P7|
|                |              |  4|&larr;|  3|                |RXD     |            |
|                |              |  5|&rarr;|  2|                |TXD     |            |
|                |              |  6|&larr;|  5|                |CTS     |            |
|                |              |   |      |   |                |        |            |
|SC126 main board|P5/P15, P6/P16|  1|  —   |  2|MCS-51MD shifter|GND     |            |
|                |              |  2|&rarr;|  6|                |RTS     |            |
|                |              |  3|&rarr;|  1|                |DTR/+5V |close P4, P7|
|                |              |  4|&larr;|  4|                |RXD     |            |
|                |              |  5|&rarr;|  3|                |TXD     |            |
|                |              |  6|&larr;|  5|                |CTS     |            |
