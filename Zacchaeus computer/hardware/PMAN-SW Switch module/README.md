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

|Module |Num |Sign|Function                 |Sign|Num |Module |
|-------|:--:|----|-------------------------|----|:--:|-------|
|PMAN-SW|J3/1|GND |GND                      |GND |P8/1|SC126  |
|PMAN-SW|J3/2|    |RESET button             |    |P8/2|SC126  |
