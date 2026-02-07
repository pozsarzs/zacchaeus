# Zacchaeus Microcomputer

## Hardware/SC716 RCBus SIO-2 module

### Directory content

|file                                    |description                               |
|----------------------------------------|------------------------------------------|
|SC716 description.pdf                   |detailed description                      |
|SC716 kit contents.pdf                  |contents of the kit available for purchase|
|SC716 schematic.pdf                     |schematic drawing                         |
|SC716_v1.0.0_2023-04-28_19-42_Gerber.zip|Gerber files for manufacturing            |


### About module

This is a commercially available expansion card designed by Stephen C. Cousins.
You can find the details in the original PDF files.


### Jumper settings

|Module|Num |Sign|Function                              |State     |Note|
|------|:--:|----|--------------------------------------|:--------:|----|
|SC716 |JP1 |A7-0|I/O address                           |10000000  |    | 
|SC716 |JP2 |    |clock source for port A (CLK2/X1 osc.)|2-3 closed|    |
|SC716 |JP3 |    |clock source for port B (CLK2/X1 osc.)|2-3 closed|    |
|SC716 |JP4 |    |connect bus TX to TXA/TXB             |all opened|    |
|SC716 |JP5 |    |connect bus RX to RXA/RXB             |all opened|    |
|SC716 |JP6 |    |connect bus TX2 to TXA/TXB            |all opened|    |
|SC716 |JP7 |    |connect bus RX2 to RXA/RXB            |all opened|    |
|SC716 |JP8 |IEI |daisy-chain interrupt line            |closed    |    |
|SC716 |JP9 |IEO |daisy-chain interrupt line            |closed    |    |
|SC716 |JP10|    |+5 V to serial connector A            |opened    |    |
|SC716 |JP11|    |+5 V to serial connector B            |closed    |    |


### Connection with others

The serial ports of the card are connected to the male DB9 connectors on the
back panel according to the PBKP wiring diagram.

|Module |Num |Sign|Function|Sign|Num |Module    |
|-------|:--:|----|--------|----|:--:|----------|
|SC716  |P3/1|    |GND     |TTL |2   |MCS-51M #2|
|SC716  |P3/2|    |RTS     |    |    |          |
|SC716  |P3/3|    |+5V     |TTL |1   |MCS-51M #2|
|SC726  |P3/4|    |RXD     |TTL |4   |MCS-51M #2|
|SC716  |P3/5|    |TXD     |TTL |3   |MCS-51M #2|
|SC716  |P3/6|    |CTS     |    |    |          |
