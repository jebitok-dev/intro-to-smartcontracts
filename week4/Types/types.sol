// SPDX-License-Identifier: MIL

pragma solidity ^0.8.4;

contract Types {
    uint256 a;
    string b;
    bytes c;
    address d;
    bool e;
    uint8 g;
    uint256 z;
    string m;
    bytes n;
    address s;
    bool t;
    uint8 p;
    address l;
    bool x;
    uint8 o;
}

// string - reference type
// bool - 8bytes
// uint8 - 256bytes
// evm - each slot is 32 bytes meaning 32*8 = 256
// uint8 without variable = 32 ... 31byte
// gas engulfing: fill slots with unnecessary(using uint8 without packing other things with it is more expensive than uint256)
// highest number to store on uint8 == 255(since it starts from 0)
// if you don't get the basics you won't be progressing you can't rush learning