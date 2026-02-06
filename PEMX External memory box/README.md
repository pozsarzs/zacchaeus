# External memory box

## About equipment

The PEMX is an 8-slot external EPROM bank that connects to the computer via two
PIO ports (SC717 module). The bank can use the 2764, 27128, 27256 and 27512
EPROMs and their "A" and CMOS versions. The selected EPROM is not built into the
machine's memory area, but can be copied to disk or loaded into memory (and run)
using utility programs. This equipment requires 230V AC for operation.


## Jumper settings

|Module|Num |Sign|Function            |State   |Note   |
|------|:--:|----|--------------------|:------:|-------|
|SC717 |JP1 |A7-0|I/O address         |01101000|       |
|SC717 |JP2 |IEI |daisy-chain INT line|closed  |       |
|SC717 |JP3 |IEO |daisy-chain INT line|closed  |       |
|PEMX  |JP1 |1-2 |type: 27512         |closed  |BANK #0|
|PEMX  |JP1 |3-2 |type: 2764..27256   |closed  |BANK #0|
|PEMX  |JP2 |1-2 |type: 27256, 27512  |closed  |BANK #0|
|PEMX  |JP2 |3-2 |type: 2764, 27128   |closed  |BANK #0|
|PEMX  |JP3 |1-2 |type: 27512         |closed  |BANK #4|
|PEMX  |JP3 |3-2 |type: 2764..27256   |closed  |BANK #4|
|PEMX  |JP4 |1-2 |type: 27256, 27512  |closed  |BANK #4|
|PEMX  |JP4 |3-2 |type: 2764, 27128   |closed  |BANK #4|
|PEMX  |JP5 |1-2 |type: 27512         |closed  |BANK #1|
|PEMX  |JP5 |3-2 |type: 2764..27256   |closed  |BANK #1|
|PEMX  |JP6 |1-2 |type: 27256, 27512  |closed  |BANK #1|
|PEMX  |JP6 |3-2 |type: 2764, 27128   |closed  |BANK #1|
|PEMX  |JP7 |1-2 |type: 27512         |closed  |BANK #5|
|PEMX  |JP7 |3-2 |type: 2764..27256   |closed  |BANK #5|
|PEMX  |JP8 |1-2 |type: 27256, 27512  |closed  |BANK #5|
|PEMX  |JP8 |3-2 |type: 2764, 27128   |closed  |BANK #5|
|PEMX  |JP9 |1-2 |type: 27512         |closed  |BANK #2|
|PEMX  |JP9 |3-2 |type: 2764..27256   |closed  |BANK #2|
|PEMX  |JP10|1-2 |type: 27256, 27512  |closed  |BANK #2|
|PEMX  |JP10|3-2 |type: 2764, 27128   |closed  |BANK #2|
|PEMX  |JP11|1-2 |type: 27512         |closed  |BANK #6|
|PEMX  |JP11|3-2 |type: 2764..27256   |closed  |BANK #6|
|PEMX  |JP12|1-2 |type: 27256, 27512  |closed  |BANK #6|
|PEMX  |JP12|3-2 |type: 2764, 27128   |closed  |BANK #6|
|PEMX  |JP13|1-2 |type: 27512         |closed  |BANK #3|
|PEMX  |JP13|3-2 |type: 2764..27256   |closed  |BANK #3|
|PEMX  |JP14|1-2 |type: 27256, 27512  |closed  |BANK #3|
|PEMX  |JP14|3-2 |type: 2764, 27128   |closed  |BANK #3|
|PEMX  |JP15|1-2 |type: 27512         |closed  |BANK #7|
|PEMX  |JP15|3-2 |type: 2764..27256   |closed  |BANK #7|
|PEMX  |JP16|1-2 |type: 27256, 27512  |closed  |BANK #7|
|PEMX  |JP16|3-2 |type: 2764, 27128   |closed  |BANK #7|


## Connection with others

Internal ribbon cable between main board and DB25F connector on the back panel:

|Module|Num  |Sign|Function                           |Sign|Num   |Module|
|------|:---:|----|-----------------------------------|----|:----:|------|
|board |J3/1 |AD0 |register selector and output enable|AD0 |J3A/1 |back  |
|board |J3/2 |AD2 |register selector and output enable|AD2 |J3A/2 |back  |
|board |J3/3 |AD4 |register write clock               |AD4 |J3A/3 |back  |
|board |J3/4 |AD6 |register input data                |AD6 |J3A/4 |back  |
|board |J3/5 |GND |GND                                |GND |J3A/5 |back  |
|board |J3/6 |J5/1|spare                              |    |J3A/6 |back  |
|board |J3/7 |J5/2|spare                              |    |J3A/7 |back  |
|board |J3/8 |J5/3|spare                              |    |J3A/8 |back  |
|board |J3/9 |GND |GND                                |GND |J3A/9 |back  |
|board |J3/10|BD0 |output data                        |BD0 |J3A/10|back  |
|board |J3/11|BD2 |output data                        |BD2 |J3A/11|back  |
|board |J3/12|BD4 |output data                        |BD4 |J3A/12|back  |
|board |J3/13|BD6 |output data                        |BD6 |J3A/13|back  |
|board |J3/14|AD1 |register selector and output enable|AD1 |J3A/14|back  |
|board |J3/15|AD3 |register selector and output enable|AD3 |J3A/15|back  |
|board |J3/16|AD5 |register input data                |AD5 |J3A/16|back  |
|board |J3/17|AD7 |register input data                |AD7 |J3A/17|back  |
|board |J3/18|GND |GND                                |GND |J3A/18|back  |
|board |J3/19|J1/1|spare                              |    |J3A/19|back  |
|board |J3/20|J1/2|spare                              |    |      |      |
|board |J3/21|J1/3|spare                              |    |J3A/20|back  |
|board |J3/22|GND |GND                                |GND |J3A/21|back  |
|board |J3/23|BD1 |output data                        |BD1 |J3A/22|back  |
|board |J3/24|BD3 |output data                        |BD3 |J3A/23|back  |
|board |J3/25|BD5 |output data                        |BD5 |J3A/24|back  |
|board |J3/26|BD7 |output data                        |BD7 |J3A/25|back  |


Y-cable between equipment and two PIO ports:

|Module|Num|Sign|Function |Sign|Num   |Module|
|------|:-:|----|---------|----|:----:|------|
|PIO #1|  2| P0 |data line|AD0 |J3A/1 |back  |
|PIO #1|  4| P2 |data line|AD2 |J3A/2 |back  |
|PIO #1|  6| P4 |data line|AD4 |J3A/3 |back  |
|PIO #1|  8| P6 |data line|AD6 |J3A/4 |back  |
|PIO #1| 18|GND |GND      |GND |J3A/5 |back  |
|PIO #1|  3| P1 |data line|AD1 |J3A/14|back  |
|PIO #1|  5| P3 |data line|AD3 |J3A/15|back  |
|PIO #1|  7| P5 |data line|AD5 |J3A/16|back  |
|PIO #1|  9| P7 |data line|AD7 |J3A/17|back  |
|PIO #1| 25|GND |GND      |GND |J3A/18|back  |
|PIO #2|  2| P0 |data line|BD0 |J3A/10|back  |
|PIO #2|  4| P2 |data line|BD2 |J3A/11|back  |
|PIO #2|  6| P4 |data line|BD4 |J3A/12|back  |
|PIO #2|  8| P6 |data line|BD6 |J3A/13|back  |
|PIO #2| 18|GND |GND      |GND |J3A/9 |back  |
|PIO #2|  3| P1 |data line|BD1 |J3A/22|back  |
|PIO #2|  5| P3 |data line|BD3 |J3A/23|back  |
|PIO #2|  7| P5 |data line|BD5 |J3A/24|back  |
|PIO #2|  9| P7 |data line|BD7 |J3A/25|back  |
|PIO #2| 25|GND |GND      |GND |J3A/21|back  |


## Software

This hardware is accompanied by a collection of functions (written in
Assembly), a Turbo Pascal include file, and a compiled, relocatable
object module—the latter of which can be linked to your own programs.

### Utilities

- _emxdump.com_: Saves a selected EPROM range to disk or displays it.
- _emxload.com_: Loads a selected EPROM range into memory starting at a specific RAM address.
