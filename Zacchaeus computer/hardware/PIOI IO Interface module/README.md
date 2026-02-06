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
relay contact outputs. The module requires +5V DC to operate.

The color-coded connectors for the inputs and outputs and the LEDs with optical
fiber are on the front panel. The color of the inputs is green, the color of the
outputs is yellow, the GND is black. The ground of the inputs and the ground of
the device are not connected.

#### The installed module

<p align="center">
<img style="width:50%;height:auto; margin:auto 0 10px 0 0;" alt="Appearance"
  src="pioi.jpg" border="10">
</p>

### Jumper settings

|Module|Num|Sign|Function            |State   |Note|
|------|:-:|----|--------------------|:------:|----|
|PIOI  |JP1|    |TTL level type +5V  |closed  |    |
|PIOI  |JP2|    |TTL level type +3.3V|opened  |    |
|SC719 |JP1|A7-0|I/O address         |00001011|0x0B|


### Connection with others

The module is connected to the computer bus by a SC719 RCBus DIO module.

|Module|Num   |Sign |Function               |Sign|Num   |Module|
|------|:----:|-----|-----------------------|----|:----:|------|
|PFRP  |J11-14|PI0-3|protected input 0-3    |    |J1/1-4|PIOI  |
|PFRP  |J15   |GND  |isolated GND           |    |J1/5  |PIOI  |
|PIOI  |J2/1  |     |protected input 0      | I0 |P2/1  |SC719 |
|PIOI  |J2/1  |     |protected input 0      | I1 |P2/3  |SC719 |
|PIOI  |J2/2  |     |protected input 1      | I2 |P2/5  |SC719 |
|PIOI  |J2/2  |     |protected input 1      | I3 |P2/7  |SC719 |
|PIOI  |J2/3  |     |protected input 2      | I4 |P2/9  |SC719 |
|PIOI  |J2/3  |     |protected input 2      | I5 |P2/11 |SC719 |
|PIOI  |J2/4  |     |protected input 3      | I6 |P2/13 |SC719 |
|PIOI  |J2/4  |     |protected input 3      | I7 |P2/15 |SC719 |
|PPOW  |      |+5V  |+5V power input        |+5V |J3/1  |PIOI  |
|PPOW  |      |GND  |GND                    |GND |J3/2  |PIOI  |
|SC719 |P2/2  | O0  |open collector output 0|    |J4/1  |PIOI  |
|SC719 |P2/4  | O1  |open collector output 1|    |J4/2  |PIOI  |
|SC719 |P2/6  | O2  |open collector output 2|    |J4/3  |PIOI  |
|SC719 |P2/8  | O3  |open collector output 3|    |J5/4  |PIOI  |
|SC719 |P2/10 | O4  |relay output 0         |    |J5/1  |PIOI  |
|SC719 |P2/12 | O5  |relay output 1         |    |J5/2  |PIOI  |
|SC719 |P2/14 | O6  |relay output 2         |    |J5/3  |PIOI  |
|SC719 |P2/16 | O7  |relay output 3         |    |J5/4  |PIOI  |
|PIOI  |J6/1  |     |relay output 0 NO      |RCO0|J22   |PFRP  |
|PIOI  |J6/2  |     |relay output 0 COM     |RCO0|J23   |PFRP  |
|PIOI  |J6/3  |     |relay output 0 NC      |RCO0|J21   |PFRP  |
|PIOI  |J7/1  |     |relay output 1 NO      |RCO0|J25   |PFRP  |
|PIOI  |J7/2  |     |relay output 1 COM     |RCO0|J24   |PFRP  |
|PIOI  |J7/3  |     |relay output 1 NC      |RCO0|J26   |PFRP  |
|PIOI  |J8/1  |     |relay output 2 NO      |RCO0|J28   |PFRP  |
|PIOI  |J8/2  |     |relay output 2 COM     |RCO0|J27   |PFRP  |
|PIOI  |J8/3  |     |relay output 2 NC      |RCO0|J29   |PFRP  |
|PIOI  |J9/1  |     |relay output 3 NO      |RCO0|J31   |PFRP  |
|PIOI  |J9/2  |     |relay output 3 COM     |RCO0|J30   |PFRP  |
|PIOI  |J9/3  |     |relay output 3 NC      |RCO0|J32   |PFRP  |
|PIOI  |J10/ 1|     |open collector output 0|OCO0|J16   |PFRP  |
|PIOI  |J10/2 |     |open collector output 1|OCO0|J17   |PFRP  |
|PIOI  |J10/3 |     |open collector output 2|OCO0|J18   |PFRP  |
|PIOI  |J10/4 |     |open collector output 3|OCO0|J19   |PFRP  |
|PIOI  |J10/5 |     |GND                    |OCO0|J20   |PFRP  |


### Softwares

This hardware comes a function collection (in assembly language) and a compiled,
relocatable object code module, the latter of which can be linked to our own
program. Additionally, a simple test program were also created.
