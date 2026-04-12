# Zacchaeus Microcomputer

## EMXUtilities

|Key         |Value                                             |
|------------|--------------------------------------------------|
|version     |v0.1                                              |
|licence     |EUPL v1.2                                         |
|architecture|Z80                                               |
|OS          |CP/M-80                                           |
|compiler    |SLR Systems Z80ASM v1.32 (1986)                   |
|            |Borland Turbo Pascal v3.01A (1985)                |
|author      |[Pozsar Zsolt](mailto:pozsarzs@gmail.com) (2026)  |
|web         |[Pozsi's homepage](https://www.pozsarzs.hu)       |
|            |[on Github](https://github.com/pozsarzs/zacchaeus)|

- EMXDump is a listing and saving utility. Lists the entire contents of the
  selected EPROM in hexadecimal and character format or saves them to disk in
  the same or binary format.
- EMXLoad is a data loading utility for lowFAT type content. Displays the table
  of contents  of the selected EPROM, saves it in binary format, loads it into
  memory, and if necessary, starts the selected entry.

### Usage

emxdump command [options]

commands:
  d(ump) - Print the entire EPROM contents to the screen or to a file in
           readable hexadecimal format.
  s(ave) - Save the entire EPROM contents to a file in binary format.

options:
  /a:0..255     - base adress of the Z80PIO (default: 12)
  /b:0..7       - EPROM bank (default: 0)
  /f:file       - target file (default: target.bin)
  /s:8|16|32|64 - EPROM size in kB (default: 8)

examples:
  emxdump d /b:7 /s:32 /f:eprom.lst
  emxdump s /f:eprom.bin /b:7 /s:32
  emxload command [options]
                                                                                
commands:
  c(ontent)s - Show table of contents.
  l(oad)     - Load selected entry into the memory.
  r(run)     - Load and run selected entry.
  s(save)    - Save selected entry in binary format to disc.
 
options:
  /a:0..255  - base adress of the Z80PIO (default: 12)
  /b:0..7    - EPROM bank (default: 0)
  /e:1..31   - entry (default: 1)
  
examples:
  emxdump d /b:7 /s:32 /f:eprom.lst
  emxdump s /f:eprom.bin /b:7 /s:32
