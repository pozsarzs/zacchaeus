# Zacchaeus Microcomputer

## Hardware/PIOI IO interface module directory

## Directory content

|file                 |description                   |
|---------------------|------------------------------|
|\[pioi\]             |KiCAD files                   |
|pioi-B_Cu.pdf        |solder side of the PCB        |
|pioi-F_Cu.pdf        |component side of the PCB     |
|pioi-F_Silkscreen.pdf|silkscreen of the PCB         |
|pioi-gerber.zip      |Gerber files for manufacturing|
|pioi.pdf             |schematic drawing             |


## About module

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
|      |JP2 |    |TTL level type +3.3V|opened     |    |
|SC719 |JP1 |A7-0|I/O address         |00001011   |0x0B|


### Connection with others

The module is connected to the computer bus by a SC719 RCBus DIO module:

|Module|Num  |Sign|Function                 |Sign|Num |Module |
|------|:---:|----|-------------------------|----|:--:|-------|
|SC719 |P2/1 | IN |Input PI0                |    |J2/1|PIOI   |
|      |P2/3 |    |Input PI0                |    |J2/1|PIOI   |
|      |P2/5 |    |Input PI1                |    |J2/2|PIOI   |
|      |P2/7 |    |Input PI1                |    |J2/2|PIOI   |
|      |P2/9 |    |Input PI2                |    |J2/3|PIOI   |
|      |P2/11|    |Input PI2                |    |J2/3|PIOI   |
|      |P2/13|    |Input PI3                |    |J2/4|PIOI   |
|      |P2/15|    |Input PI3                |    |J2/4|PIOI   |
|      |P2/17|    |GND                      |    |    |       |
|      |P2/2 |    |Output OCO0              |    |J4/1|PIOI   |
|      |P2/4 |    |Output OCO1              |    |J4/2|PIOI   |
|      |P2/6 |    |Output OCO2              |    |J4/3|PIOI   |
|      |P2/8 |    |Output OCO3              |    |J5/4|PIOI   |
|      |P2/10|    |Output RCO0              |    |J5/1|PIOI   |
|      |P2/12|    |Output RCO1              |    |J5/2|PIOI   |
|      |P2/14|    |Output RCO2              |    |J5/3|PIOI   |
|      |P2/16|    |Output RCO2              |    |J5/4|PIOI   |
|      |P2/18|    |GND                      |    |    |       |

### Softwares

This hardware comes a function collection (in assembly language) and a compiled,
relocatable object code module, the latter of which can be linked to our own
program.
