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

## Chained pins

```
  GND-S1/1z -> S1/1b-S2/1z -> S2/1b-S3/1z -> ... -> S8/1b-S9/1z
```
