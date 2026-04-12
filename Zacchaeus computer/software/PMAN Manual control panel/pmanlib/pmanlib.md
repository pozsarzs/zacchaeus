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
|10h|on/off  |     |        |DPBLNK  |        |         |
|11h|number  |digit|        |DPWDIG  |        |         |
|12h|databyte|     |dataword|DPWAAD  |        |         |
|13h|databyte|     |        |DPWBYB  |        |         |
|14h|databyte|     |        |DPWBYH  |        |         |
|15h|        |     |        |DPWMIR  |        |         |
|16h|        |     |dataword|DPWWRD  |        |         |
|20h|        |     |        |SWRADD  |        |dataword |
|21h|        |     |        |SWRBTN  |databyte|         |
|22h|        |     |        |SWRDAT  |databyte|         |
|23h|        |     |        |SWRMIR  |        |         |
|24h|databyte|     |        |SWWLED  |        |         |

**Notes:**  
  - _bufaddr.:_ address of the buffer area [00..FFh]
  - _databyte:_ data byte [00..FFh]
  - _dataword:_ data word [0000..FFFFh]
  - _digit:_ number of the display digit [0..7]
  - _ioaddr:_ base i/o address (BA) of interface [00..FFh]
  - _number:_ single digit number [0..F]

### Hardware access

#### Hexadecimal display on display module

|_on the board_|DIS1|DIS2|DIS3|DIS4|DIS5|DIS6|DIS7|DIS8|
|--------------|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|_logical name_|DIG0|DIG1|DIG2|DIG3|DIG4|DIG5|DIG6|DIG7|
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
|_logical name_|         |RST |NMI |A13 |A12 |A11 |A10 |A09 |A08 |
|_i/o address_ |select   |    |    |BA+5|BA+5|BA+5|BA+5|BA+5|BA+5|
|_data_        |select   |    |    |02h |01h |80h |40h |20h |10h |
|_i/o address_ |read     |    |    |BA+6|BA+6|BA+6|BA+6|BA+6|BA+6|
|_data_        |read     |    |    |0Bh |07h |0Eh |0Dh |0Bh |07h |
