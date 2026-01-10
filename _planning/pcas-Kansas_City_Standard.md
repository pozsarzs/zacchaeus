## Kansas City Standard

### BYTE's Audio Cassette Standards Symposium

Manfred and Virgina Peschke
BYTE, Feb 1976, Pages 72 and 73

BYTE Magazine sponsored a symposium on November 7 and 8, 1975 in Kansas City MO regarding the
interchange of data on inexpensive consumer quality audio cassette drives. These drives may be used as one
of the mass storage devices in the first generation of personal computers, and will retain importance for some
time to come as a means of interchange of software between computer enthusiasts who purchase products of
the small systems industry. In order to promote the growth of the industry, BYTE sought to achieve an
industry standard on audio cassette data interchange through a working conference.
We extend our greatest appreciation to the 18 people who worked very hard until late Friday night and
Saturday morning to discuss the multitude of problems and solutions associated with digital recording on
auto cassettes. The names of the participants are listed in table 1. In spite of the short time available, the
participants were able to draft a set of provisional standards which seems to promise great reliability and is
rather inexpensive to implement; implementations may be entirely in hardware, or may require a mix of
software and some minimal hardware. Considerations were given to the problems of speed variation among
recorders and playback equipment, start and stop delays, recording density (or speed) versus reliability, and
recording frequencies to avoid interference with the telephone network in case some users plan to transmit
the tones of the cassette over the phone lines.

On Saturday afternoon, Mr. Felsenstein and Mr. Mauch volunteered to write up the consensus among the
participants as to a provisional standard which has been reproduced below.

### Provisional Audio Cassette Data Interchange Standard

The consensus among the participants of the audio cassette standards symposium at Kansas City MO
sponsored by BYTE Magazine is as follows:

The proposed standard centers around the use of a frequency shift modulation method from which serial
clock data can be extracted at rates of up to 300 baud. The system is intended to be used with low to medium
cost cassette recorders incorporating electrical stop and start capability which may be operated under
program control.

The technique proposed provides for long and short term tape speed variation, limitations in bandwidth due
to effects such as tape misalignment, and the necessity to retain low cost and low complexity of the hardware.
The technique allows for potential operation at higher tape speed than the nominal 1.875 inch/s (4.75 cm/s).
A mark (logical one) bit consists of eight cycles at a frequency of 2400 Hz.
A space (logical zero) bit consists of four cycles at a frequency of 1200 Hz.
A recorded character consists of a space as a start bit, eight data bits, and two or more marks as stop bits.
The interval between characters consists of an unspecified amount of time at the mark frequency. In this
respect the data format is similar to that of asynchronous data communication.
The eight data bits are organized least significant bit first, most significant bit last, and followed (optionally)
by a parity bit. The total number of significant bits and the parity bit cannot exceed 8.
Where less than eight data bits are used, the unused bits (following the optional parity bit) at the end of the
character are mark bits (2400 Hz).

Data will be organized in blocks of arbitrary and optionally variable length, preceded by a minimum of five
seconds of marks. To avoid errors due to splice and wrinkle problems common at the beginning of tape, the
beginning of the first data block will occur no sooner than 30 seconds from the beginning of clear leader.
The contents of the data block are not specified.

The data block ends after the stop bits of the final character.

Bit clocking information may be extracted from the recorded waveform, which is always an integer multiple
of the bit rate, regardless of tape speed. This permits the recovery and retiming of data by means of a UART,
which requires a clock of sixteen times the bit rate, although other simple circuitry may be used.
A reliable bandwidth of 3000 Hz was assumed in choosing mark and space frequencies due to the head
misalignment expected between various cassette recorders. The recording technique is a redundant form of
Manchester or bifrequency code which has a long history of reliability in the computer industry. In its present
form it was proposed by three independent manufacturers at the conference. One cited reliability rates of one
error in 10**7 characters for 200 passes.

### Participants at Audio Cassette Symposium

- Ray Borrill, 1218 Prairie Dr, Bloomington IN
- Hal Chamberlin, The Computer Hobbyist, P 0 Box 5985, Raleigh NC 27607
- Tom Durston, MITS, 6328 Linn NE, Albuquerque NM
- Lee Felsenstein, LGC Engineering, 1807 Delaware St, Berkeley CA 94703
- Joe Frappier, Mikra-D, 32 Maple St, Bellingham MA
- Bill Gates, MITS
- Gary Kay, Southwest Technical Products Corp, 219 W Rhapsody, San Antonio TX 78216
- Bob Marsh, Processor Technology, 2465 Fourth St, Berkeley CA 94710
- Harold A Mauch, Pronetics, 4021 Windsor, Garland TX 75042
- Bob Nelson, PCM, San Ramon CA
- George Perrine, HAL Communications Corp, Box 365, Urbana IL 61801
- Ed Roberts, MITS
- Richard Smith, The Computer Hobbyist, P 0 Box 5882, Raleigh NC 27607
- Les Solomon, Popular Electronics, 1 Park Av, New York NY 10016
- Michael Stolowitz, Godbout Electronics, Box 2355, Oakland Airport CA 94614
- Paul Tucker, HAL Communications Corp
- Mike Wise, Sphere, 791 S 500 W, Bountiful UT 84010
- Bob Zaller, MITS
