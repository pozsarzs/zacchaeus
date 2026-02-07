# Zacchaeus Microcomputer

## Hardware/SC126 Z180 motherboard

### Directory content

|file                  |description                               |
|----------------------|------------------------------------------|
|SC126 assembled.jpg   |picture about assembled board             | 
|SC126 description.pdf |detailed description                      |
|SC126 kit contents.pdf|contents of the kit available for purchase|
|SC126 schematic.pdf   |schematic drawing                         |


### About module

This is a commercially available motherboard built with a Z180 processor
designed by Stephen C. Cousins. You can find the details in the original PDF
files.


### Jumper settings

|Module|Num |Sign|Function                    |State     |Note|
|------|:--:|----|----------------------------|:--------:|----|
|SC126 |JP1 |    |ROMWBW write protect        |1-2 closed|    |
|SC126 |JP2 |    |SCM S6 write protect        |1-2 closed|    |
|SC126 |JP3 |    |flash select                |2-3 closed|    |
|SC126 |JP4 |    |DCD0/DREQ1 select           |1-2 closed|    |
|SC126 |JP5 |    |I<sup>2</sup>C to bus socket|all opened|    |
|SC126 |P4  |    |+5V to serial connector P5  |closed    |    |
|SC126 |P7  |    |+5V to serial connector P6  |opened    |    |


### Connection with others

|Module |Num |Sign|Function|Sign|Num |Module    |
|-------|:--:|----|--------|----|:--:|----------|
|PMAN-SW|J4/1|    |GND     |    |P8/1|SC126     |
|PMAN-SW|J4/2|    |Reset   |    |P8/2|SC126     |
|SC126  |P5/1|    |GND     |TTL |2   |MCS-51M #1|
|SC126  |P5/2|    |RTS     |    |    |          |
|SC126  |P5/3|    |+5V     |TTL |1   |MCS-51M #1|
|SC126  |P5/4|    |RXD     |TTL |4   |MCS-51M #1|
|SC126  |P5/5|    |TXD     |TTL |3   |MCS-51M #1|
|SC126  |P5/6|    |CTS     |    |    |          |
