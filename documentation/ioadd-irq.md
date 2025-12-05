# Zacchaeus Microcomputer

## I/O address table

|From|To  |Module|Function                          |Note     |
|---:|---:|------|----------------------------------|---------|
|0x00|0x0A|      |                                  |         |
|    |0x0B|SC719 |MM8D module’s ports               |         |
|    |0x0C|SC126 |System I/O port (RTC, SPI and I2C)|default  |
|    |0x0D|SC126 |LED output port                   |default  |
|0x0E|0x0F|      |                                  |         |
|0x10|0x17|SC715 |CF card                           |default  |
|0x18|0x6A|      |                                  |         |
|    |0x6B|SC717 |Z80 PIO’s internal I/O registers  |suggested|
|0x6C|0x7F|      |                                  |         |
|0x80|0x83|SC716 |Z80 SIO/2’s internal I/O registers|suggested|
|0x84|0x8A|      |                                  |         |
|    |0x8B|SC718 |Z80 CTC’s internal I/O registers  |suggested|
|0x8C|0xBF|      |                                  |         |
|0xC0|0xFF|SC126 |Z180’s internal I/O registers     | default |


## IRQ table

|Number|Module|Function                          |Note     |
|:----:|------|----------------------------------|---------|
|NMI   |      |                                  |         |
|INT1  |      |                                  |         |
|INT2  |      |                                  |         |
|INT3  |      |                                  |         |
|INT4  |      |                                  |         |
