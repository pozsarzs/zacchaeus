# Zacchaeus Microcomputer

## Hardware/PTAP Tape and speaker interface module

### Directory content

|file                 |description                                  |
|---------------------|---------------------------------------------|
|\[ptap\]             |KiCAD files                                  |
|KCS.md               |Excerpts from the Kansas City Standard (1976)|
|ptap-B_Cu.pdf        |solder side of the PCB                       |
|ptap-F_Cu.pdf        |component side of the PCB                    |
|ptap-F_Silkscreen.pdf|silkscreen of the PCB                        |
|ptap-gerber.zip      |Gerber files for manufacturing               |
|ptap.pdf             |schematic drawing                            |


### About module

This BP-80 bus system-compatible expansion card includes a flexibly configurable
tape interface and a speaker driver.


#### Tape Interface

* **Data source:** Jumper-selectable between the serial port of the BP-80 bus
  or an external connector.
* **Modulation:** Supports the standard KCS (Kansas City Standard) format,
  as well as the FSK mode using individual frequency pairs, which allows
  faster data transfer at higher tape speeds.
* **Output:** Harmonically-filtered, clean sinusoidal signal, with two
  jumper-selectable signal levels.
* **Input:** Automatically muted when not in use. The input stage has a 600 Hz
  low-pass filter to eliminate annoying low-frequency noise and fluctuations
  caused by tape stretch.
* **Control:** Has a built-in tape motor remote control and an operating mode
  output for front-panel LEDs. The control LED on the card monitors both the
  transmit and receive processes. Thanks to the gated logic control, the LED
  provides visual feedback by flashing for every active data traffic.

### Speaker interface

* **Signal Source:** Channels 1 and 2 of the Z80 CTC card connected in cascade.
  Signal coming from an "user" pin of the BP-80 bus, which can be enabled in
  software with a gating signal.
* **Output:** Harmonic-filtered, TTL-level signal and integrated transistor
  amplifier stage for driving low-impedance speakers. The output volume can be
  adjusted with a trimmer potentiometer.


### Jumper settings

All operating parameters of the card can be customized by jumpering.

|Module|Num   |Sign  |Function                        |State     |Note                     |
|------|:----:|:----:|--------------------------------|:--------:|-------------------------|
|SC718 |JP3   |CLK   |CTC1 clock source: system clock |closed    |                         |
|      |      |CLK2  |CTC1 clock source: CLK2         |opened    |                         |
|      |      |CLKX  |CTC1 clock source: X1 oscillator|opened    |                         |
|      |      |INT1  |CTC1 clock source: INT1         |opened    |                         |
|      |      |INT2  |CTC1 clock source: INT2         |opened    |                         |
|SC718 |JP4   |CLK   |CTC2 clock source: system clock |opened    |                         |
|      |      |CLK2  |CTC2 clock source: CLK2         |opened    |                         |
|      |      |CLKX  |CTC2 clock source: X1 oscillator|opened    |                         |
|      |      |INT1  |CTC2 clock source: INT1         |opened    |                         |
|      |      |INT2  |CTC2 clock source: INT2         |opened    |                         |
|SC718 |JP6   |ZT0   |CLK2 source: CTC0 output        |closed    |                         |
|      |      |ZT1   |CLK2 source: CTC1 output        |opened    |                         |
|      |      |ZT2   |CLK2 source: CTC2 output        |closed    |                         |
|      |      |CLKX  |CLK2 source: X1 oscillator      |opened    |                         |
|      |      |CLX   |CLK2 source: system clock       |opened    |                         |
|SC718 |P2/5-6|CTCIO |ZT1-CT2 cascade                 |closed    |                         |
|PTAP  |SW1   |/A7-0 |I/O address                     |11001101  |DIP switch, address 32h  |
|PTAP  |JP1   |RX    |select RX line                  |1-2 closed|BP80/connector           |
|PTAP  |JP2   |TX    |select TX line                  |1-2 closed|BP80/connector           |
|PTAP  |JP3   | T600 |TX frequency pair               |          |L: 1-2 closed            |
|      |      |T1200 |                                |          |L: 1-2, H: 2-3 closed    |
|      |      |T2400 |                                |1-2 closed|L: 1-2, H: 2-3 closed    |
|      |      |T4800 |                                |2-3 closed|L: 1-2, H: 2-3 closed    |
|      |      |T9600 |                                |          |L: 1-2, H: 2-3 closed    |
|      |      |T19200|                                |          |H: 2-3 closed            |
|PTAP  |JP4   | R600 |FSK RX frequency pair           |          |L: 1-2 closed            |
|      |      |R1200 |                                |          |L: 1-2, H: 2-3 closed    |
|      |      |R2400 |                                |1-2 closed|L: 1-2, H: 2-3 closed    |
|      |      |R4800 |                                |2-3 closed|L: 1-2, H: 2-3 closed    |
|      |      |R9600 |                                |          |L: 1-2, H: 2-3 closed    |
|      |      |R19200|                                |          |H: 2-3 closed            |
|PTAP  |JP5   |TLVL  |Tape output level               |          |Aux: 1-2, mic: 2-3 closed|
|PTAP  |JP6   |SPLVL |Speaker output level            |2-3 closed|TTL: 1-2, amp: 2-3 closed|


### Recording/Playback Parameters

The recording parameters are based on recommendations made at a symposium
held in Kansas City in 1975. (Kansas City Standard)

|medium  |tape speed|level L|cycle|level H |cycle|baudrate |bandwidth|note        |
|--------|---------:|------:|:---:|-------:|:---:|--------:|--------:|------------|
|cassette| 4.76 cm/s|1200 Hz|  4  | 2400 Hz|  8  | 300 baud|   ~3 kHz|original KCS|
|cassette| 4.76 cm/s|2400 Hz|  4  | 4800 Hz|  8  | 600 baud|   ~5 kHz|maximal     |
|tape    | 2.38 cm/s| 600 Hz|  4  | 1200 Hz|  8  | 150 baud|   ~2 kHz|suggested   |
|tape    | 4.76 cm/s|1200 Hz|  4  | 2400 Hz|  8  | 300 baud|   ~3 kHz|suggested   |
|tape    | 9.53 cm/s|2400 Hz|  4  | 4800 Hz|  8  | 600 baud|   ~5 kHz|suggested   |
|tape    |19.05 cm/s|4800 Hz|  4  | 9600 Hz|  8  |1200 baud|  ~10 kHz|suggested   |
|tape    | 2.38 cm/s|1200 Hz|  4  | 2400 Hz|  8  | 300 baud|   ~3 kHz|maximal     |
|tape    | 4.76 cm/s|4800 Hz|  4  | 9600 Hz|  8  |1200 baud|  ~10 kHz|maximal     |
|tape    | 9.53 cm/s|4800 Hz|  4  | 9600 Hz|  8  |1200 baud|  ~10 kHz|maximal     |
|tape    |19.05 cm/s|9600 Hz|  4  |19200 Hz|  8  |2400 baud|  ~20 kHz|maximal     |

The maximum values​were calculated based on the parameters of the UHER 4000
tape recorder used.

### Connection with others

The module is connected to the BP80 expansion socket.

|Module|Num  |Sign|Function          |Sign  |Num |Module|
|------|:---:|----|------------------|------|:--:|------|
|PTAP  |J1   |    |expansion socket  |      |    |SC126 |
|PTAP  |J2/1 |REL |tape connector    |REL   |J1/1|PFRP  |
|      |J2/2 |DIN |tape connector    |DIN   |J1/4|PFRP  |
|      |J2/3 |GND |tape connector    |GND   |J1/2|PFRP  |
|      |J2/4 |DOUT|tape connector    |DOUT  |J1/5|PFRP  |
|      |J2/5 |REL |tape connector    |REL   |J1/3|PFRP  |
|PTAP  |J3   |RLED|READ LED (green)  |RLED  |D3  |PFRP  |
|PTAP  |J4   |WLED|WRITE LED (red)   |WLED  |D4  |PFRP  |
|PTAP  |J5   |MLED|MOTOR LED (yellow |MLED  |D5  |PFRP  |
|PTAP  |J6   |SPK |speaker           |TTL in|J3  |PSPK  |


### Softwares

This hardware comes a function collection (in assembly language) and a compiled,
relocatable object code module, the latter of which can be linked to our own
program.

 Additionally, a simple test program and a playback program were also
prepared.

