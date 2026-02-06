# External interface box

## Directory content

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


## About equipment

The PEIX serves as an 8-slot external interface, designed to integrate legacy
_Klöckner-Moeller PS316_ I/O modules with the Zacchaeus computer. Although the
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


## Jumper settings

|Module|Num |Sign|Function            |State   |Note   |
|------|:--:|----|--------------------|:------:|-------|
|      |    |    |                    |        |       |


## Connection with others

|Module|Num  |Sign|Function                           |Sign|Num   |Module|
|------|:---:|----|-----------------------------------|----|:----:|------|
|      |     |    |                                   |    |      |      |

## Softwares

(..)


## Legal Disclaimer & Interoperability Statement

### Purpose of this Project

This project involves the reverse engineering of the connection points and
interface logic of the Moeller/Eaton PS316 I/O cards. The sole purpose of this
work is to achieve interoperability between legacy industrial hardware and
modern control systems, ensuring the continued use and maintenance of existing
equipment (Right to Repair).


### Legal Basis (EU & USA)

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


### Status of the PS316 System

**Legacy Hardware:** The PS316 series, originally manufactured by Moeller (now
part of Eaton), is a legacy product line that has reached End-of-Life (EOL) and
End-of-Support (EOS) status.

**Commercial Non-Competition:** This project does not compete with any current
product offered by the original manufacturer. Documentation for these cards is
no longer commercially available or supported by the vendor.

**Functional Information:** The information shared (such as pinouts, voltage
levels, and signal paths) is strictly functional and does not constitute a
"creative work" protected by copyright.


### Intellectual Property Compliance

**No Proprietary Code:** This repository does not contain any proprietary
firmware, binary blobs, or copyrighted software extracted from the devices.

**Independent Implementation:** All schematics, drivers, and adapter designs
provided here are original works created by the author based on the discovered
functional parameters.
