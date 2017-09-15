//: Playground - noun: a place where people can play

import UIKit

var someInt = 3
var anotherInt = 107
var c = 0
func swapTwoInts(_ a: inout Int, _ b: inout Int) -> Int {
  c = someInt + anotherInt
  return c
}
print(swapTwoInts(&someInt, &anotherInt))