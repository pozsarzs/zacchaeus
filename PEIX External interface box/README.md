# External interface box

## About equipment

The PEIX serves as an 8-slot external interface, designed to integrate legacy
_Klöckner-Moeller PS316_ I/O modules with the Zacchaeus computer. Although the
PS316 family has been obsolete since the mid-2000s, this circuit enables
continued functionality by interfacing with the system's original analog and
digital I/O modules.

The device is controlled by a circuit built with an 87C51 microcontroller.
It is responsible for controlling the PLC modules and communicating with
Zacchaeus via the RS-232 serial port.

Adapting the device's variously controllable, undocumented modules to a
non-original device is a complex, multi-step task, so I implement the
microcontroller-based interface on a prototype board of the same size as the
other modules.

The documentation for PLC modules contains only what is necessary to understand
the control. Modules can also be used perfectly as "black boxes" if we know
their characteristics and control method.

This equipment requires 230 V AC for operation.


## Mechanical structure

The device remains in the original PS 316.x08 housing, which also includes the
backplane. The built-in power supply was from the PS416 PLC, the control and
communication module follows the design of the PS416 NET-400 module. Their
front panel also hides the permanently connected connectors. The I/O modules
are made for the older PS316 system. The original connectors of the digital
modules were not used, the front panel contacts are ideal for stable connection
of crocodile clips. Remember, this is just a 'toy', it will not perform a
serious control task.

**Modules**

|Slot|Sign     |Function                 |Note|
|----|---------|-------------------------|----|
| #0 |         |power supply             |    |
| #1 |PEIX     |control and communication|    |
| #2 |         |                         |    |
| #3 |         |                         |    |
| #4 |         |                         |    |
| #5 |         |                         |    |
| #6 |EBE 206.1|digital input            |    |
| #7 |EBE 206.1|digital input            |    |
| #8 |EBE 266.1|digital output           |    |
| #9 |EBE 266.1|digital output           |    |


## Jumper settings

|Module     |Num |Sign    |Function                 |State     |Note        |
|-----------|:--:|--------|-------------------------|:--------:|------------|
|PEIX       |JP1 |EXT ROM |enable external ROM      |closed    |            |
|PEIX       |JP2 |AKT LED |MCU ACT LED from port PC7|1-2 closed|            |
|EBE 206.1@6|SW1 |'DA0-5  |card address             |10100000  |switch 1..8 |
|EBE 206.1@7|SW1 |'DA0-5  |card address             |01100000  |switch 1..8 |
|EBE 266.1@8|SW1 |'DA0-5  |card address             |11100000  |switch 1..8 |
|EBE 266.1@9|SW1 |'DA0-5  |card address             |00010000  |switch 1..8 |

(..)


## Connection with others

|Module|Num |Sign|Function              |Sign|Num   |Module     |
|------|:--:|----|----------------------|----|:----:|-----------|
|PEIX  |J7/2|RXD |received data (DCE)   |RXD |DB9M/2|serial port|
|PEIX  |J7/3|TXD |transmitted data (DCE)|TXD |DB9M/3|serial port|
|PEIX  |J7/5|RXD |GND                   |GND |DB9M/5|serial port|


## Software

The software in the control and communication module of the PEIX is responsible
for the I/O cards and the communication between itself and the control computer.

The program stores the analog and digital signals coming from the I/O cards and
to be written there in Modbus registers. Reading and writing are repeated
periodically, as long as there are no incoming telegrams on the serial port.

External data exchange takes place via an interrupt-based serial connection.
This ensures a fast and reliable connection between the hardware and the
monitoring system. The module communicates with the computer via a simple
custom protocol (TLCP).


## Legal disclaimer & interoperability statement

### Purpose of this project

This project involves the reverse engineering of the connection points and
interface logic of the Moeller/Eaton PS316 I/O cards. The sole purpose of this
work is to achieve interoperability between legacy industrial hardware and
modern control systems, ensuring the continued use and maintenance of existing
equipment (Right to Repair).


### Legal basis (EU & USA)

This project is conducted and shared in compliance with the following legal
frameworks:

**European Union:** In accordance with Directive 2009/24/EC, reverse engineering
for the purpose of interoperability is legally permitted. The data provided here
is the result of independent observation and testing of legally acquired
hardware.

**United States:** This project falls under the Fair Use doctrine and the DMCA
Section 1201(f) exemption. These provisions allow for the circumvention of
access controls (if any) and the analysis of hardware for the sole purpose of
enabling a software program or hardware device to exchange and use information
with other systems.


### Status of the PS316 system

**Legacy hardware:** The PS316 series, originally manufactured by Moeller (now
part of Eaton), is a legacy product line that has reached End-of-Life (EOL) and
End-of-Support (EOS) status.

**Commercial non-competition:** This project does not compete with any current
product offered by the original manufacturer. Documentation for these cards is
no longer commercially available or supported by the vendor.

**Functional information:** The information shared (such as pinouts, voltage
levels, and signal paths) is strictly functional and does not constitute a
"creative work" protected by copyright.


### Intellectual property compliance

**No proprietary code:** This repository does not contain any proprietary
firmware, binary blobs, or copyrighted software extracted from the devices.

**Independent implementation:** All schematics, drivers, and adapter designs
provided here are original works created by the author based on the discovered
functional parameters.
