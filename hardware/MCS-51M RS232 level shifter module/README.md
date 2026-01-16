# Zacchaeus Microcomputer

## Hardware/MCS-51M RS232 level shifter module

### Directory content

|file                 |description     |
|---------------------|----------------|
|MCS-51M assembled.jpg|assembled module|
|MCS-51M size.jpg     |board sizes     |


### About module

This is a commercially available level shifter module for RS232 communication.

**Original description:**  

This module can realize mutual conversion between TTL level and RS232 level.
The RS-232 side is a standard male/female connector, which is convenient for
connecting to external equipment. Integrated RTS/CTS flow control and power
supply, sending and receiving indicator lights. With four M3 positioning holes,
original chip, speed can be as high as 500KHZ (460800bps).

The module is a standard wire sequence, which is exactly the same as the DB9
male/female connector that comes with the computer (2: RX, 3: TX, 5: GND,
7: RTS, 8: CTS). 

_Pin description:_  

- VCC: 3-5.5V power supply positive
- GND: The negative pole of the 3-5.5V power supply.
- TX: TTL signal flows in.
- RX: TTL signal flows out.
- CTS: Flow control signal, outgoing
- RTS: flow control signal, inflow


### Jumper settings

The level shifter module does not have jumpers.


### Connection with others

The level shifter module is mounted on the backplane and connected to the
motherboard. The wiring is located in the motherboard's README.md.


### Softwares

The level shifter module does not have its own software.
