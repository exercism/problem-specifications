# Instructions

A parity bit is simple way of detecting transmission errors.
The transmitters and receives can only transmit and receive *exactly* eight bits at a time (including the parity bit).
The parity bit is set so that there is an *even* number 1s in each transmission and is always the first bit from the right.
So if the receiver receives `11000001`, `01110101` or  `01000000` (i.e. a transmission with an odd number of 1 bits), it knows there is an error. 

However, messages are rarely this short. 
The message needs to be transmitted in a sequence when they are longer.

For example, consider the message `11000000 00000001 11000000 11011110` (or in `C0 01 C0 DE` hex).

Since each transmission contains exactly eight bits, it can only contain seven bits of data and the parity bit.
A parity bit must then be inserted after every seven bits of data:

```text
11000000 00000001 11000000 11011110
      ↑       ↑       ↑       ↑        (7th bits)
```

So transmission sequence for this message looks like this:

```text
1100000_ │ 0000000_ │ 0111000_ │ 0001101_ │ 1110
       ↑          ↑          ↑          ↑         (parity bit locations)
```

The data in the first transmission in the sequence (`1100000`) has two 1 bits (an even number), so the parity bit is 0.
The first transmission becomes `11000000` (or `C0` in hex).

The data in the next transmission (`0000000`) has none (an even number again), so the parity bit is 0 again.
The second transmission becomes  `00000000` (or `00` in hex).

The data for the next two transmissions (`0111000` and `0001101`) have three 1 bits.
Their parity bits are set to 1 so that they have an even number of 1 bits in the transmission.
They are transmitted as `01110001` and `00011011` (or `71` and `1B` in hex).

The last transmission (`1110`) has only four bits of data.
Since exactly eight bits are transmitted at a time and the parity bit is the right most bit, three 0 bits and then the parity bit is added to make up eight bits.
It now looks like this (where `_` is the parity bit):

```text
1110 000_
     ↑↑↑   (added 0 bits)
```

There is an odd number of 1 bits again, so the parity bit is to 1.
The last transmission in the sequence becomes `11100001` (or `E1` in hex).

The entire transmission sequence for this message then `11000000 00000000 01110001 00011011 11100001` (or `C0 00 71 1B E1` in hex).

Your job is to help implement the message sequencer to calculate the transmission sequence and the decoder for receiving messages.
