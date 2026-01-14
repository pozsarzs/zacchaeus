# Zacchaeus Microcomputer

## Hardware/PIOI IO interface module

### Directory content

|file                 |description                   |
|---------------------|------------------------------|
|\[pioi\]             |KiCAD files                   |
|pioi-B_Cu.pdf        |solder side of the PCB        |
|pioi-F_Cu.pdf        |component side of the PCB     |
|pioi-F_Silkscreen.pdf|silkscreen of the PCB         |
|pioi-gerber.zip      |Gerber files for manufacturing|
|pioi.pdf             |schematic drawing             |


### About module

The PIOI is a combined interface module originally built for another device.
It has 4 isolated 5..12V digital inputs, 4 open collector outputs and 4 NC/NO
relay contact outputs. The module requires 5V DC to operate.

The color-coded connectors for the inputs and outputs and the LEDs with optical
fiber are on the front panel. The color of the inputs is green, the color of the
outputs is yellow, the GND is black. The ground of the inputs and the ground of
the device are not connected.


### Jumper settings

|Module|Num |Sign|Function            |State      |Note|
|------|:--:|----|--------------------|:---------:|----|
|PIOI  |JP1 |    |TTL level type +5V  |closed     |    |
|PIOI  |JP2 |    |TTL level type +3.3V|opened     |    |
|SC719 |JP1 |A7-0|I/O address         |00001011   |0x0B|


### Connection with others

The module is connected to the computer bus by a SC719 RCBus DIO module:

|Module|Num  |Sign|Function                 |Sign|Num |Module |
|------|:---:|----|-------------------------|----|:--:|-------|
|SC719 |P2/1 | I0 |Input PI0                |    |J2/1|PIOI   |
|SC719 |P2/3 | I1 |Input PI0                |    |J2/1|PIOI   |
|SC719 |P2/5 | I2 |Input PI1                |    |J2/2|PIOI   |
|SC719 |P2/7 | I3 |Input PI1                |    |J2/2|PIOI   |
|SC719 |P2/9 | I4 |Input PI2                |    |J2/3|PIOI   |
|SC719 |P2/11| I5 |Input PI2                |    |J2/3|PIOI   |
|SC719 |P2/13| I6 |Input PI3                |    |J2/4|PIOI   |
|SC719 |P2/15| I7 |Input PI3                |    |J2/4|PIOI   |
|SC719 |P2/17|    |GND                      |    |    |       |
|SC719 |P2/2 | O0 |Output OCO0              |    |J4/1|PIOI   |
|SC719 |P2/4 | O1 |Output OCO1              |    |J4/2|PIOI   |
|SC719 |P2/6 | O2 |Output OCO2              |    |J4/3|PIOI   |
|SC719 |P2/8 | O3 |Output OCO3              |    |J5/4|PIOI   |
|SC719 |P2/10| O4 |Output RCO0              |    |J5/1|PIOI   |
|SC719 |P2/12| O5 |Output RCO1              |    |J5/2|PIOI   |
|SC719 |P2/14| O6 |Output RCO2              |    |J5/3|PIOI   |
|SC719 |P2/16| O7 |Output RCO2              |    |J5/4|PIOI   |
|SC719 |P2/18|    |GND                      |    |    |       |

SC719
### Softwares

This hardware comes a function collection (in assembly language) and a compiled,
relocatable object code module, the latter of which can be linked to our own
program.
