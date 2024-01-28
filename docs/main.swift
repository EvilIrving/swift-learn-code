// The Swift Programming Language
// https://docs.swift.org/swift-book
let maxNumber = 10
var currentNumber = 7 // 当前值
print("Hello, world!")

// 好的 这是多行注释
// 第二行

let cat = "cat"
print("cat")

let minValue = UInt8.min // minValue 为 0，是 UInt8 类型
let maxValue = UInt8.max // maxValue 为 255，是 UInt8 类型

let isBool = true

if isBool {
    print("true")
} else {
    print("false")
}

let err404 = (404, "error", "unused", "unused")
// let (code,_) = err404
print("status msg is \(err404.3)")

// let httpcode = (statusCode: 200, statusMsg: "wrong")
// let possibleNumber = "123"
// let convertedNumber = Int(possibleNumber)
// print("\(convertedNumber)")

// var serverResponseCode : Int? = 404
// print("\(serverResponseCode)")

// serverResponseCode = nil
// print("\(serverResponseCode)")

// if convertedNumber != nil {
//     print("convertedNumber contains some integer value.")
// }
// if convertedNumber != nil {
//     print("convertedNumber has an integer value of: \(convertedNumber!)")
// }

// if let actualNumber = Int(possibleNumber) {
//     print("\(possibleNumber) has an integer value of \(actualNumber)")
// } else {
//     print("\(possibleNumber) could not be converted to an integer")
// }

// func makeASandwich() throws {
//     // ...
// }

// do {
//     try makeASandwich()eatASandwich
//     ()
// } catch SandwichError.outOfCleanDishes {
//     washDishes()
// } catch SandwichError.missingIngredients(let ingredients) {
//     buyGroceries(ingredients)
// }

// let age = 4

// assert(age > 5,"age > 5 是错误的")

// let something = "ome string literal value"

// let quotation = """
// The White Rabbit put on his spectacles.  "Where shall I begin,
// please your Majesty?" he asked.

// "Begin at the beginning," the King said gravely, "and go on
// till you come to the end; then stop."
// """

// print("\(something)")
// print("\(quotation)")

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

print("\(singleLineString)")
print("\(multilineString)")

let softWrappedQuotation = """
a 
b 
c
"""
let sparklingHeart = "\u{1F496}"
print("\(sparklingHeart)")
