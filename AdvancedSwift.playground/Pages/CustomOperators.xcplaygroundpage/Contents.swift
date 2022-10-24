import Foundation

//Overflow operators
// 1) &+
// 2) &-
// 3( &*

// you create custom operators with keywords
// 1) prefix
prefix operator +++ 
// 2) infix
// 3) postfis
// 4) assign

// matirial was taked from https://www.youtube.com/watch?v=g2PaLan8IgA
// STANDARD OPERATORS
// 1) Bitwise NOT (~) operator, inverts all bits in a number

let initialBits: Int8 = 0b00001111
let invertedBits = ~initialBits // equals 0b11110000

//2) Bitwise AND (&) saves 1s only if both nums have a 1

let firstBitwiseAND : Int8 = 0b00001111
let secondBitsiseAND: Int8 = 0b00110011
//                           0b00000011
let ANDResult: Int8 = firstBitwiseAND & secondBitsiseAND // equals 0b00000011

//3) Bitwise OR (|) saves 1s if any of nums has a 1

let firstBitwiseOR : Int8 = 0b01111111
let secondBitwiseOR: Int8 = 0b00000001
//                          0b11111111
let ORResult: Int8 = firstBitwiseOR | secondBitwiseOR

//4) Bitwise NOR (^) gives a 0 if both nums are 1 and 1 if at least one num is 1

let firstBitwiseXOR:  UInt8 = 0b10001000
let secondBitwiseXOR: UInt8 = 0b00001000
//                            0b10000000

//5) Bitwise shift operators left shift (<<) and right shift (>>)
// Shifting left one bit doubles an integer's value
// Shifting righ one bit halves an integer's value

// Unsign integers, "Logical shift"

let initial: Int8 = 0b00000001   // 1 , 0b00000001
let one     = initial << 1       // 2 , 0b00000010
let two     = initial << 2       // 4 , 0b00000100
let three   = initial << 3       // 8 , 0b00001000
let four    = initial << 4       // 16, 0b00010000

let final   = initial << 5       // 32, 0b00100000

let oneBack   = final >> 1       // 16, 0b00010000
let twoBack   = final >> 2       // 8 , 0b00001000
let threeBack = final >> 3       // 4 , 0b00000100
let fourBack  = final >> 4       // 2 , 0b00000010
let fiveBack  = final >> 5       // 1 , 0b00000001

//> USAGE

let pink: Int32 = 0xCC6699
let redComponent   = (pink & 0xFF0000) >> 16 // 0xCC
let greenComponent = (pink & 0x00FF00) >> 8  // 0x66 let blueComponent  = pink & 0x0000FF         // 0x99

// Integers, logical "Two's complement notation"
