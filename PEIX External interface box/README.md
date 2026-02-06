# Zacchaeus Microcomputer

## Hardware/PEIX External interface box

### Directory content

|file                   |description                                  |note|
|-----------------------|---------------------------------------------|----|
|hardware/0116-a04/*    |backplane                                    |    |
|hardware/78-070-0300/* |power supply module                          |    |
|hardware/aim62-1/*     |sub-module directory                         |    |
|hardware/aqm61-2/*     |sub-module directory                         |    |
|hardware/ebe_206-1/*   |module directory                             |    |
|hardware/ebe_266-1/*   |module directory                             |    |
|hardware/ebe_275-2/*   |module directory                             |    |
|hardware/ebe_287-1/*   |module directory                             |    |
|hardware/peix/*        |KiCAD files                                  |    |
|hardware/0116-a04.md   |backplane                                    |    |
|hardware/78-070-0300.md|power supply module                          |    |
|hardware/aim61-2.md    |I/f converter sub-module (4-20 mA)           |    |
|hardware/aqm61-2.md    |D/A converter sub-module (-10..+10 V)        |    |
|hardware/ebe_206-1.md  |16-channel digital input module              |    |
|hardware/ebe_266-1.md  |16-channel digital output module             |    |
|hardware/ebe_275-2.md  |4-channel analog input module                |    |
|hardware/ebe_287-1.md  |4-channel analog output module               |    |
|hardware/peix.pdf      |schematic drawing                            |    |
|LEGAL.md               |Legal Disclaimer & Interoperability Statement|    |


### About equipment

The PEIX serves as an 8-slot external interface, designed to integrate legacy
Klockner-Moeller PS316 I/O modules with the Zacchaeus computer. Although the
PS316 family has been obsolete since the mid-2000s, this circuit enables
continued functionality by interfacing with the system's original analog and
digital I/O modules.

The device is powered by a circuit built with an 80C51 microcontroller. It is
responsible for controlling the PLC modules and communicating with Zacchaeus
via the RS-232 serial port.

Adapting the device's variously controllable, undocumented modules to a
non-original device is a complex, multi-step task, so I implement the
microcontroller-based interface on a prototype board of the same size as the
other modules.

The documentation for PLC modules contains only what is necessary to understand
the control. Modules can also be used perfectly as "black boxes" if we know
their characteristics and control method.

This equipment requires 230 V AC for operation.


### Jumper settings

|Module|Num |Sign|Function            |State   |Note   |
|------|:--:|----|--------------------|:------:|-------|
|      |    |    |                    |        |       |


### Connection with others

|Module|Num  |Sign|Function                           |Sign|Num   |Module|
|------|:---:|----|-----------------------------------|----|:----:|------|
|      |     |    |                                   |    |      |      |

### Softwares

(..)
