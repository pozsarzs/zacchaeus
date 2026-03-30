# Zacchaeus Microcomputer

## Hardware/PMAN-IF interface module

### Directory content

|file                    |description                   |
|------------------------|------------------------------|
|\[pman-if\]             |KiCAD files                   |
|pman-if-B_Cu.pdf        |solder side of the PCB        |
|pman-if-F_Cu.pdf        |component side of the PCB     |
|pman-if-F_Silkscreen.pdf|silkscreen of the PCB         |
|pman-if-gerber.zip      |Gerber files for manufacturing|
|pman-if.jpg             |module                        |
|pman-if.pdf             |schematic drawing             |

### About module

The PMAN-IF module is responsible for connecting the 8-digit hexadecimal
display, the switch and push-button matrix, and the status LEDs to the system
bus. The module requires +5V DC for operation.

### Jumper settings

|Module |Num |Sign |Function   |State   |Note                      |
|-------|:--:|-----|-----------|:------:|--------------------------|
|PMAN-IF|SW1 |/A7-3|I/O address|0xx10111|DIP switch, address 40-47h|

### Connection with others

|Module |Num |Sign|Function                 |Sign|Num |Module |
|-------|:--:|----|-------------------------|----|:--:|-------|
|PMAN-IF|J4/1|+5V |+5V                      |+5V |J1/1|PMAN-DP|
|PMAN-IF|J4/2|GND |GND                      |GND |J1/2|PMAN-DP|
|PMAN-IF|J3/1| S0 |DIS1/5 selection         | S0 |J2/1|PMAN-DP|
|PMAN-IF|J3/2| S1 |DIS2/6 selection         | S1 |J2/2|PMAN-DP|
|PMAN-IF|J3/3| S2 |DIS3/7 selection         | S2 |J2/3|PMAN-DP|
|PMAN-IF|J3/4| S3 |DIS4/8 selection         | S3 |J2/4|PMAN-DP|
|PMAN-IF|J3/5| BL |DIS1-8 blank             | BL |J2/5|PMAN-DP|
|PMAN-IF|J2/1| D0 |DIS1-4 data input A      | D0 |J3/1|PMAN-DP|
|PMAN-IF|J2/2| D1 |DIS1-4 data input B      | D1 |J3/2|PMAN-DP|
|PMAN-IF|J2/3| D2 |DIS1-4 data input C      | D2 |J3/3|PMAN-DP|
|PMAN-IF|J2/4| D3 |DIS1-4 data input D      | D3 |J3/4|PMAN-DP|
|PMAN-IF|J2/5| D4 |DIS5-8 data input A      | D4 |J3/5|PMAN-DP|
|PMAN-IF|J2/6| D5 |DIS5-8 data input B      | D5 |J3/6|PMAN-DP|
|PMAN-IF|J2/7| D6 |DIS5-8 data input C      | D6 |J3/7|PMAN-DP|
|PMAN-IF|J2/8| D7 |DIS5-8 data input D      | D7 |J3/8|PMAN-DP|
|PMAN-IF|J6/1| C0 |Column output            | C0 |J1/1|PMAN-SW|
|PMAN-IF|J6/2| C1 |Column output            | C1 |J1/2|PMAN-SW|
|PMAN-IF|J6/3| C2 |Column output            | C2 |J1/3|PMAN-SW|
|PMAN-IF|J6/4| C3 |Column output            | C3 |J1/4|PMAN-SW|
|PMAN-IF|J6/5| C4 |Column output            | C4 |J1/5|PMAN-SW|
|PMAN-IF|J6/6| C5 |Column output            | C5 |J1/6|PMAN-SW|
|PMAN-IF|J6/7| C6 |Column output            | C6 |J1/7|PMAN-SW|
|PMAN-IF|J6/8| C7 |Column output            | C7 |J1/8|PMAN-SW|
|PMAN-IF|J2/1| R0 |Row selection (A0-A7)    | R0 |J2/1|PMAN-SW|
|PMAN-IF|J2/2| R1 |Row selection (A8-A15)   | R1 |J2/2|PMAN-SW|
|PMAN-IF|J2/3| R2 |Row selection (D0-D7)    | R2 |J2/3|PMAN-SW|
|PMAN-IF|J2/4| R3 |Row selection (buttons)  | R3 |J2/4|PMAN-SW|
|PMAN-IF|J8/1|GND |GND                      |GND |J4/1|PMAN-SW|
|PMAN-IF|J8/2|    |NMI button               |    |J4/2|PMAN-SW|
|PMAN-IF|J7/1|GND |Common cathode           |GND |J5/1|PMAN-SW|
|PMAN-IF|J7/2|    |ERROR LED anode          |    |J5/2|PMAN-SW|
|PMAN-IF|J7/3|    |RUN LED anode            |    |J5/3|PMAN-SW|
|PMAN-IF|J7/4|    |PAUSE LED anode          |    |J5/4|PMAN-SW|
|PMAN-IF|J7/5|    |STOP LED anode           |    |J5/5|PMAN-SW|
