# Zacchaeus Microcomputer

## Modules in the expansion sockets

|Unit       |Socket|Modul |Function                                  |Note   |
|-----------|------|------|------------------------------------------|-------|
|motherboard|  S3  |PMAN  |manual programming unit's interface module|planned|
|motherboard|  S2  |PCOX  |Covox module                              |planned|
|backplane  |  K1  |SC718 |CTC module                                |       |
|backplane  |  K2  |SC716 |SIO/2 module                              |       |
|backplane  |  K3  |SC719 |DIO for PIOI module                       |       |
|backplane  |  K4  |SC719 |DIO for PCAS module                       |planned|
|backplane  |  K5  |PANA  |analog I/O module                         |planned|
|backplane  |  K6  |SC717 |PIO module                                |       |
|backplane  |  P1  |SC715 |CF module                                 |       |

The order is important because of daisy-chain interrupt handling.
