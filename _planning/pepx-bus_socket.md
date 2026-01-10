## Bus socket pinout

|Pin|Function             |card-CPU|Own sign|DI |DO |AI |AO |Note               |
|---|---------------------|--------|--------|---|---|---|---|-------------------|
| 2a|GND                  |        |        | + | + | + | + |                   |
| 4a|+5V                  |        |        | + | + | + | + |                   |
| 6a|DOn status           |  --->  |        |   | + |   |   |                   |
| 8a|/card not selected   |  --->  |        |   | + |   |   |                   |
|10a|/reset               |  <---  |        |   | + | + | + |                   |
|12a|DIn status           |  <---  |        | + |   |   |   |                   |
|14a|card address 5 == SW6|  <---  |        | + | + |   |   |                   |
|16a|card address 4 == SW5|  <---  |        | + | + |   |   |                   |
|18a|card address 3 == SW4|  <---  |        | + | + |   |   |                   |
|20a|card address 2 == SW3|  <---  |        | + | + |   |   |                   |
|22a|card address 1 == SW2|  <---  |        | + | + |   |   |                   |
|24a|card address 0 == SW1|  <---  |        | + | + |   |   |                   |
|26a|select mux/demux     |  <---  |        | + | + |   |   |L/H: DI0..7/DI8..15|
|28a|mux/demux selector A |  <---  |        | + | + |   |   |common inputs      |
|30a|mux/demux selector B |  <---  |        | + | + |   |   |common inputs      |
|32a|mux/demux selector C |  <---  |        | + | + |   |   |common inputs      |
| 2b|                     |        |        |   |   |   |   |chained, see [^1]  |
| 4b|                     |        |        |   |   |   |   |                   |
| 6b|                     |        |        |   |   |   |   |                   |
| 8b|                     |        |        |   |   |   |   |                   |
|10b|unknown              |  <---  |        |   |   | + | + |see [^2]           |
|12b|unknown              |  --->  |        |   |   | + | + |see [^3]           |
|14b|unknown              |        |        |   |   | + | + |see [^4]           |
|16b|detect socket number |        |        |   |   | + | + |see [^5]           |
|18b|data 0               |  <-->  |        |   |   | + | + |                   |
|20b|data 2               |  <-->  |        |   |   | + | + |                   |
|22b|data 4               |  <-->  |        |   |   | + | + |                   |
|24b|data 6               |  <-->  |        |   |   | + | + |                   |
|26b|address 0            |  <---  |        |   |   | + | + |                   |
|28b|address 2            |  <---  |        |   |   | + | + |                   |
|30b|address 4            |  <---  |        |   |   | + | + |                   |
|32b|address 6            |  <---  |        |   |   | + | + |                   |
| 2z|                     |        |        |   |   |   |   |chained, see [^5]  |
| 4z|                     |        |        |   |   |   |   |                   |
| 6z|                     |        |        |   |   |   |   |                   |
| 8z|                     |        |        |   |   |   |   |                   |
|10z|unknown              |  <---  |        |   |   | + | + |see [^6]           |
|12z|unknown              |  <---  |        |   |   | + | + |see [^7]           |
|14z|GND?                 |        |        |   |   | + | + |                   |
|16z|detect socket number |        |        |   |   | + | + |                   |
|18z|data 1               |  <-->  |        |   |   | + | + |                   |
|20z|data 3               |  <-->  |        |   |   | + | + |                   |
|22z|data 5               |  <-->  |        |   |   | + | + |                   |
|24z|data 7               |  <-->  |        |   |   | + | + |                   |
|26z|address 1            |  <---  |        |   |   | + | + |                   |
|28z|address 3            |  <---  |        |   |   | + | + |                   |
|30z|address 5            |  <---  |        |   |   | + | + |                   |
|32z|address 7            |  <---  |        |   |   | + | + |                   |

## Socket number detection

sockets: 0..9 - PS/CPU/cards

|socket|shorted pins|shorted pins|16b|16z|
|------|------------|------------|---|---|
|  0   |            |            |   |   |
|  1   | 16b - 20b  | 16z - 20z  |D2 |D3 |
|  2   | 16b - 22b  | 16z - 18z  |D4 |D1 |
|  3   | 16b - 20b  |            |D2 |   |
|  4   | 16b - 22b  | 16z - 20z  |D4 |D3 |
|  5   | 16b - 18z  | 16z - 20z  |D1 |D3 |
|  6   | 16b - 20b  | 16z - 22z  |D2 |D5 |
|  7   | 16b - 20z  | 16z - 22z  |D3 |D5 |
|  8   | 16b - 22b  | 16z - 22z  |D4 |D5 |
|  9   | 16b - 24b  | 16z - 18z  |D6 |D1 |

## Notes

[^1]: chained on backplane (see 5)
[^2]: connect to on A0: LS244/15
[^3]: connect to on A0: LS244/18
[^4]: connect to on A0: PAL0310/1
[^5]: chained on backplane:
```
  GND-S1/1z -> S1/1b-S2/1z -> S2/1b-S3/1z -> ... -> S8/1b-S9/1z
```
[^6]: connect to on AO: LS244/11
[^7]: connect to on AO: LS244/13
