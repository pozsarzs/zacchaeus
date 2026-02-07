# Zacchaeus Microcomputer

## Hardware/SC717 RCBus PIO module

### Directory content

|file                                    |description                               |
|----------------------------------------|------------------------------------------|
|SC717 description.pdf                   |detailed description                      |
|SC717 kit contents.pdf                  |contents of the kit available for purchase|
|SC717 schematic.pdf                     |schematic drawing                         |
|SC717_v1.0.0_2023-05-07_17-00_Gerber.zip|Gerber files for manufacturing            |


### About module

This is a commercially available expansion card designed by Stephen C. Cousins.
You can find the details in the original PDF files.


### Jumper settings

|Module|Num|Sign|Function                  |State   |Note|
|------|:-:|----|--------------------------|:------:|----|
|SC717 |JP1|A7-0|I/O address               |01101000|    |
|SC717 |JP2|IEI |daisy-chain interrupt line|closed  |    |
|SC717 |JP3|IEO |daisy-chain interrupt line|closed  |    |


### Connection with others

The paralel ports of the card are connected to the female DB25 connectors on the
back panel according to the PBKP wiring diagram.
