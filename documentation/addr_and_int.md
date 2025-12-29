# Zacchaeus Microcomputer

## Memory address table

|From   |To     |Function              |
|------:|------:|----------------------|
|0x00000|0x7FFFF|Flash ROM (512k bytes)|
|0x80000|0xFFFFF|RAM (512k bytes)      |


## I/O address table

|From|To  |Module|Function                          |Note     |
|---:|---:|------|----------------------------------|---------|
|0x00|0x09|      |                                  |         |
|    |0x0A|SC719 |DIO module for PCAS               |planned  |
|    |0x0B|SC719 |DIO module for PIOI               |         |
|    |0x0C|SC126 |system I/O port (RTC, SPI and I2C)|         |
|    |0x0D|SC126 |LED output port                   |         |
|    |0x0E|PCOX  |Covox sound output                |         |
|    |0x0F|      |                                  |         |
|0x10|0x17|SC715 |CF card                           |         |
|0x20|0x27|PMAN  |Manual programming unit's card    |planned  |
|0x28|0x2F|PANA  |analog I/O ports                  |planned  |
|0x30|0x67|      |                                  |         |
|0x68|0x6B|SC717 |PIO module                        |         |
|0x6C|0x7F|      |                                  |         |
|0x80|0x83|SC716 |SIO/2 module                      |         |
|0x84|0x87|      |                                  |         |
|0x88|0x8B|SC718 |CTC module                        |         |
|0x8C|0xBF|      |                                  |         |
|0xC0|0xFF|SC126 |Z180’s internal I/O registers     |         |


## IRQ table

|Number|Module|Function                          |Note     |
|:----:|------|----------------------------------|---------|
|NMI   |      |                                  |         |
|INT0  |      |                                  |         |
|INT1  |      |                                  |         |
|INT2  |      |                                  |         |
