# Zacchaeus Microcomputer

## Hardware/PCOX COVOX module

### Directory content

|file                 |description                   |
|---------------------|------------------------------|
|\[pcox\]             |KiCAD files                   |
|pcox-B_Cu.pdf        |solder side of the PCB        |
|pcox-F_Cu.pdf        |component side of the PCB     |
|pcox-F_Silkscreen.pdf|silkscreen of the PCB         |
|pcox-gerber.zip      |Gerber files for manufacturing|
|pcox.pdf             |schematic drawing             |


### About module

This BP-80 bus-compatible expansion board combines the classic The Covox Speech
Thing with a headphone amplifier. It uses a simple R-2R resistor ladder to
convert 8-bit digital audio into analog output. The board has LINE and headphone
outputs, with headphone volume control. The module requires +5V and +12V DC to
operate.


### Jumper settings

|Module|Num |Sign |Function   |State   |Note                   |
|------|:--:|-----|-----------|:------:|-----------------------|
|PCOX  |SW1 |/A7-0|I/O address|11001110|DIP switch, address 31h|


### Connection with others

The module is connected to the BP80 expansion socket.

|Module|Num  |Sign|Function            |Sign|Num   |Module|
|------|:---:|----|--------------------|----|:----:|------|
|PCOX  |J1   |    |expansion socket    |    |      |SC126 |
|PCOX  |J2/1 |LINE|line output         |AOUT|J3/1  |PBKP  |
|PCOX  |J2/2 |GND |GND                 |GND |J3/2  |PBKP  |
|PCOX  |J3/1 |VOL |volume potentiometer|VOL |P1/1-2|PFRP  |
|PCOX  |J3/2 |GND |GND                 |GND |P1/3  |PFRP  |
|PPOW  |     |+12V|+12V input          |+12V|J4/1  |PCOX  |
|PPOW  |     |GND |GND                 |GND |J4/2  |PCOX  |
|PCOX  |J5/1 |EAR |earphone output     |EAR |J1/S-T|PFRP  |
|PCOX  |J5/2 |GND |GND                 |GND |J1/G  |PFRP  |
