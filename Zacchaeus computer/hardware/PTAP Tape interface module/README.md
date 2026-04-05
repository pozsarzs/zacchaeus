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
|ptap.jpg             |module                                       |
|ptap.pdf             |schematic drawing                            |

### About module

This is a universal, MCU-based, BP-80 bus system-compatible expansion card
includes a flexibly configurable tape and speaker interfaces. The firmware
supports the FSK (Frequency-shift keying) modulation mode. The analog part of
the card can be used in the entire audio frequency band (20Hz-20 kHz). The data
transfer rate is 300-2400 baud, the frequency pairs can be between
600Hz-19.2 kHz. The module can be configured from the operating program. After
power-off or RESET, the default settings take effect. The module requires a +5 V
and a symmetrical 12 V power supply to operate.

#### Tape Interface

* **Data source:** Jumper-selectable between the serial port of the BP-80 bus
  or an external connector.
* **Modulation:** MCU's firmware supports the Kansas City Standard format, as
  well as the FSK mode using individual frequency pairs, which allows faster
  data transfer at higher tape speeds.
* **Output:** Harmonically filtered, sinusoidal signal, the level of which can
  be adjusted within limits with a trimmer potentiometer (mic/line level).
* **Input:** Automatically muted when not in use.
<<<<<<< HEAD
* **Control:** It has a built-in tape motor remote control and a mode indicator
  light output for the front panel LEDs.

### Speaker interface

* **Output:** TTL-level signal output and integrated transistor amplifier stage
  for driving low-impedance speakers.

### Jumper settings

All operating parameters of the card can be customized by jumpering.

|Module|Num   |Sign  |Function                        |State     |Note                     |
|------|:----:|:----:|--------------------------------|:--------:|-----------------------|
|PTAP  |SW1   |/A7-2 |I/O address                     |101011xx  |DIP switch, address 50h|
|PTAP  |JP1   |RXD0  |select RX line                  |1-2 closed|BP80/connector         |
|PTAP  |JP2   |TXD0  |select TX line                  |1-2 closed|BP80/connector         |
|PTAP  |JP3   |      |mute speaker amplifier          |opened    |                       |
|PTAP  |JP4   |      |enable speaker amplifier        |closed    |                       |

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
|PTAP  |J2   |    |piezo speaker     |TTL in|J3  |PSPK  |
|PTAP  |J3   |    |dynamic speaker   |      |    |      |
|PTAP  |J4   |RLED|READ LED (green)  |RLED  |D3  |PFRP  |
|PTAP  |J5   |WLED|WRITE LED (red)   |WLED  |D4  |PFRP  |
|PTAP  |J6   |MLED|MOTOR LED (yellow |MLED  |D5  |PFRP  |
|PPOW  |     |+12V|+12V input        |+12V|J7/1  |PCOX  |
|PPOW  |     |GND |GND               |GND |J7/2  |PCOX  |
|PPOW  |     |-12V|-12V input        |-12V|J7/3  |PCOX  |
|PTAP  |J8/1 |REL |tape connector    |REL   |J1/1|PFRP  |
|      |J8/2 |DIN |tape connector    |DIN   |J1/4|PFRP  |
|      |J8/3 |GND |tape connector    |GND   |J1/2|PFRP  |
|      |J8/4 |DOUT|tape connector    |DOUT  |J1/5|PFRP  |
|      |J8/5 |REL |tape connector    |REL   |J1/3|PFRP  |
