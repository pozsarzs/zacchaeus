# I/O address table

|Ffrom|To|Module  |Function                           |Note      |
|----:|---:|------|-----------------------------------|-----------|
|     |0x0B| SC719| MM8D module’s ports               |           |
|     |0x0C| SC126| System I/O port (RTC, SPI and I2C)| default   |
|     |0x0D| SC126| LED output port                   | default   |
|0x10 |0x17| SC715| CF card                           | default   |
|     |0x6B| SC717| Z80 PIO’s internal I/O registers  | suggested |
|0x80 |0x83| SC716| Z80 SIO/2’s internal I/O registers| suggested |
|     |0x8B| SC718| Z80 CTC’s internal I/O registers  | suggested |
|0xC0 |0xFF| SC126| Z180’s internal I/O registers     | default   |
