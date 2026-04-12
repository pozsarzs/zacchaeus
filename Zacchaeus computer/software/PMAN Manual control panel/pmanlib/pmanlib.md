# Zacchaeus Microcomputer

## PMAN routine collection

|Key         |Value                                             |
|------------|--------------------------------------------------|
|version     |v0.1                                              |
|licence     |EUPL v1.2                                         |
|architecture|Z80                                               |
|OS          |CP/M-80                                           |
|compiler    |SLR Systems Z80ASM v1.32 (1986)                   |
|author      |[Pozsar Zsolt](mailto:pozsarzs@gmail.com) (2026)  |
|web         |[Pozsi's homepage](https://www.pozsarzs.hu)       |
|            |[on Github](https://github.com/pozsarzs/zacchaeus)|

This is a collection of routines for easy management of the manual control
panel's buttons, switches, LEDs and hexadecimal LED displays.

### Available functions

|A  |B       |C    |HL      |Function|Return A|Return HL|
|:-:|:------:|:---:|:------:|--------|:------:|:--------|
|00h|ioaddr  |     |bufaddr |IFINIT  |        |         |
|01h|on/off  |     |        |DPBLNK  |        |         |
|02h|        |     |        |DPZERO  |        |         |
|03h|databyte|     |dataword|DPWAAD  |        |         |
|04h|databyte|     |        |DPWBYB  |        |         |
|05h|databyte|stpos|        |DPWBYH  |        |         |
|06h|        |stpos|dataword|DPWWRD  |        |         |
|07h|number  |digit|        |DPWDIG  |        |         |
|08h|        |     |        |DPWMIR  |        |         |
|09h|        |     |        |SWRADD  |        |dataword |
|0Ah|        |     |        |SWRDAT  |databyte|         |
|0Bh|        |     |        |SWRBTN  |databyte|         |
|0Ch|        |     |        |SWRMIR  |        |         |
|0Dh|databyte|     |        |SWWLED  |        |         |

**Notes:**  
  - _bufaddr.:_ address of the buffer area [00..FFh]
  - _databyte:_ data byte [00..FFh]
  - _dataword:_ data word [0000..FFFFh]
  - _digit:_ number of the display digit [0..7]
  - _ioaddr:_ base i/o address (BA) of interface [00..FFh]
  - _number:_ single digit number [0..F]
  - _stpos:_ start position, byte: [1..7], word: [3..7]

### Buffer map

|offset| bit7  | bit6  | bit5  | bit4  | bit3  | bit2  | bit1  | bit0  |
|------|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|   0  |DIG7-b7|DIG7-b6|DIG7-b5|DIG7-b4|DIG7-b3|DIG7-b2|DIG7-b1|DIG7-b0|
|   1  |DIG6-b7|DIG6-b6|DIG6-b5|DIG6-b4|DIG6-b3|DIG6-b2|DIG6-b1|DIG6-b0|
|   2  |DIG5-b7|DIG5-b6|DIG5-b5|DIG5-b4|DIG5-b3|DIG5-b2|DIG5-b1|DIG5-b0|
|   3  |DIG4-b7|DIG4-b6|DIG4-b5|DIG4-b4|DIG4-b3|DIG4-b2|DIG4-b1|DIG4-b0|
|   4  |DIG3-b7|DIG3-b6|DIG3-b5|DIG3-b4|DIG3-b3|DIG3-b2|DIG3-b1|DIG3-b0|
|   5  |DIG2-b7|DIG2-b6|DIG2-b5|DIG2-b4|DIG2-b3|DIG2-b2|DIG2-b1|DIG2-b0|
|   6  |DIG1-b7|DIG1-b6|DIG1-b5|DIG1-b4|DIG1-b3|DIG1-b2|DIG1-b1|DIG1-b0|
|   7  |DIG0-b7|DIG0-b6|DIG0-b5|DIG0-b4|DIG0-b3|DIG0-b2|DIG0-b1|DIG0-b0|
|   8  |  A15  |  A14  |  A13  |  A12  |  A11  |  A10  |  A09  |  A08  |
|   9  |  A07  |  A06  |  A05  |  A04  |  A03  |  A02  |  A01  |  A00  |
|  10  |  D7   |  D6   |  D5   |  D4   |  D3   |  D2   |  D1   |  D0   |
|  11  |   0   |   0   | STEP  |  RUN  | PAUS  | STOP  | EXAM  | DEPO  |
|  11  |   0   |   0   |   0   | BLANK | LERR  | LRUN  | LPAU  | LSTP  |

The first eight bytes of the buffer contain the display (DIG7..DIG0), the next
4 byte contain the position of the address switches (A15-A08) and the data
switches (D7-D0) and status of the pushbutton row. Last byte contains the LED
status. (1 is means closed switch or active LED.)

### Hardware access

#### Hexadecimal display on display module

|_on the board_|DIS1|DIS2|DIS3|DIS4|DIS5|DIS6|DIS7|DIS8|
|--------------|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|_logical name_|DIG7|DIG6|DIG5|DIG4|DIG3|DIG2|DIG1|DIG0|
|_i/o address_ |BA+3|BA+2|BA+1|BA  |BA+3|BA+2|BA+1|BA  |
|_nibble_      |low |low |low |low |high|high|high|high|

**Note:**
 - The display blanking signal (BLANK) is the 4th bit of the data written to
   i/o address BA + 4.

#### LEDs on switch module

|_on the board_|D31 |D32 |D33 |D34 |
|--------------|:--:|:--:|:--:|:--:|
|_logical name_|LERR|LRUN|LPAU|LSTP|
|_i/o address_ |BA+4|BA+4|BA+4|BA+4|
|_bit_         | 3  | 2  | 1  | 0  |

#### Switches on switch module

|_on the board_|operation|SW1 |SW2 |SW3 |SW4 |SW5 |SW6 |SW7 |SW8 |
|--------------|:-------:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|_logical name_|         |A15 |A14 |A13 |A12 |A11 |A10 |A09 |A08 |
|_i/o address_ |select   |BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|
|_data_        |select   |08h |04h |02h |01h |80h |40h |20h |10h |
|_i/o address_ |read     |BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|
|_data_        |read     |0Eh |0Dh |0Bh |07h |0Eh |0Dh |0Bh |07h |

|_on the board_|operation|SW9 |SW10|SW11|SW12|SW13|SW14|S15 |SW16|
|--------------|:-------:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|_logical name_|         |A07 |A06 |A05 |A04 |A03 |A02 |A01 |A00 |
|_i/o address_ |select   |BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|
|_data_        |select   |08h |04h |02h |01h |80h |40h |20h |10h |
|_i/o address_ |read     |BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|
|_data_        |read     |0Eh |0Dh |0Bh |07h |0Eh |0Dh |0Bh |07h |

|_on the board_|operation|SW17|SW18|SW19|SW20|SW21|SW22|SW23|SW24|
|--------------|:-------:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|_logical name_|         | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 |
|_i/o address_ |select   |BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|
|_data_        |select   |08h |04h |02h |01h |80h |40h |20h |10h |
|_i/o address_ |read     |BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|
|_data_        |read     |0Eh |0Dh |0Bh |07h |0Eh |0Dh |0Bh |07h |

|_on the board_|operation|SW25|SW26|SW27|SW28|SW29|SW30|SW31|SW32|
|--------------|:-------:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|_logical name_|         |RST |NMI |STEP|RUN |PAUS|STOP|EXAM|DEPO|
|_i/o address_ |select   |    |    |BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|
|_data_        |select   |    |    |02h |01h |80h |40h |20h |10h |
|_i/o address_ |read     |    |    |BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|
|_data_        |read     |    |    |0Bh |07h |0Eh |0Dh |0Bh |07h |
