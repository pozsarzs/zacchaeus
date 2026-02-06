# Zacchaeus Microcomputer

## Excerpts from the Kansas City Standard (November, 1975)

The following technical specifications are quoted from the original report:
**"BYTE's Audio Cassette Standards Symposium"** (Manfred and Virginia Peschke,
[*BYTE Magazine*, February 1976](https://archive.org/details/byte-magazine-1976-02)).


### Introduction

> "The proposed standard centers around the use of a frequency shift modulation
> method from which serial clock data can be extracted at rates of up to 300
> baud. The system is intended to be used with low to medium cost cassette
> recorders incorporating electrical stop and start capability which may be
> operated under program control."


### Technical Specifications

> "The technique proposed provides for long and short term tape speed variation,
> limitations in bandwidth due to effects such as tape misalignment, and the
> necessity to retain low cost and low complexity of the hardware. [...]
> * A **mark** (logical one) bit consists of eight cycles at a frequency of **2400 Hz**.
> * A **space** (logical zero) bit consists of four cycles at a frequency of **1200 Hz**.
> * A recorded character consists of a space as a start bit, eight data bits,
>   and two or more marks as stop bits.
> * The eight data bits are organized **least significant bit first**, most
>   significant bit last. [...]
> * Data will be organized in blocks of arbitrary and optionally variable length,
>   preceded by a minimum of five seconds of marks."


### Reliability & Clocking

> "Bit clocking information may be extracted from the recorded waveform, which
> is always an integer multiple of the bit rate, regardless of tape speed. [...]
> The recording technique is a redundant form of Manchester or bifrequency code
> which has a long history of reliability in the computer industry."


### Legal Notice (Disclaimer)

**License Note:** The excepts from the BYTE Magazine article "BYTE's Audio
Cassette Standards Symposium" are included for historical and educational
purposes under fair use. These portions are **not** covered by this project's
CC0 license and remain the intellectual property of the original copyright
holder (Informa/successor to Byte Publications).
