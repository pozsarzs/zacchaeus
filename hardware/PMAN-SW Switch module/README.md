# Zacchaeus Microcomputer

## Hardware/PMAN-SW Switch module

### Directory content

|file                    |description                   |
|------------------------|------------------------------|
|\[pman-sw\]             |KiCAD files                   |
|pman-sw-B_Cu.pdf        |solder side of the PCB        |
|pman-sw-F_Cu.pdf        |component side of the PCB     |
|pman-sw-F_Silkscreen.pdf|silkscreen of the PCB         |
|pman-sw-gerber.zip      |Gerber files for manufacturing|
|pman-sw.pdf             |schematic drawing             |


### About module

The PMAN-SW module is the component of the Manual control panel, which contains
32 switches, 8 pushbuttons and 4 LEDs. Switches and six pushbuttons connected in
a matrix. The module has four row selection lines and eight column output line.
The other components are connected separately. The module does not require power
voltage to operate.


### Jumper settings

There is no jumper setting option on the module.


### Connection with others

This component is connected to the computer bus by the PMAN-IF interface module.

|Module |Num  |Sign|Function                 |Sign|Num |Module |
|-------|:---:|----|-------------------------|----|:--:|-------|
|PMAN-IF|     | C0 |Column output            | C0 |J1/1|PMAN-SW|
|PMAN-IF|     | C1 |Column output            | C1 |J1/2|PMAN-SW|
|PMAN-IF|     | C2 |Column output            | C2 |J1/3|PMAN-SW|
|PMAN-IF|     | C3 |Column output            | C3 |J1/4|PMAN-SW|
|PMAN-IF|     | C4 |Column output            | C4 |J1/5|PMAN-SW|
|PMAN-IF|     | C5 |Column output            | C5 |J1/6|PMAN-SW|
|PMAN-IF|     | C6 |Column output            | C6 |J1/7|PMAN-SW|
|PMAN-IF|     | C7 |Column output            | C7 |J1/8|PMAN-SW|
|PMAN-IF|     | R0 |Row selection (A0-A7)    | R0 |J2/1|PMAN-SW|
|PMAN-IF|     | R1 |Row selection (A8-A15)   | R1 |J2/2|PMAN-SW|
|PMAN-IF|     | R2 |Row selection (D0-D7)    | R2 |J2/3|PMAN-SW|
|PMAN-IF|     | R3 |Row selection (buttons)  | R3 |J2/4|PMAN-SW|
|SC126  |P8/1 |GND |GND                      |GND |J3/1|PMAN-SW|
|       |P8/2 |    |NMI button               |    |J3/2|       |
|PMAN-IF|     |GND |GND                      |GND |J4/1|PMAN-SW|
|       |     |    |Reset button             |    |J4/2|       |
|PMAN-IF|     |GND |Common cathode           |GND |J5/1|PMAN-SW|
|PMAN-IF|     |    |ERROR LED anode          |    |J5/2|PMAN-SW|
|PMAN-IF|     |    |RUN LED anode            |    |J5/3|PMAN-SW|
|PMAN-IF|     |    |PAUSE LED anode          |    |J5/4|PMAN-SW|
|PMAN-IF|     |    |STOP LED anode           |    |J5/5|PMAN-SW|


### Softwares

The switch module does not have its own software.
