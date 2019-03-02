import UIKit


//String Literals

//basic
let someString = "Some string literal value"

//Multiline String Literals
let qutation = """
  The White Rabbit put in his spectacles. "Where shall I begin,
  please your Majesty?" he asked

  "Begin at the beginning," the King said gravely, "and go on till you
  come to the end; then stop."
"""

let singleLineString = "These are the same"
let multilineString = """
These are the same
"""

//Special Characters in String Literals
/*
 
 - The escaped special characters \0(null character), \\(backslash), \t(horizontal tab),
   \n(line feed), \r (carriage return), \"(double quotation mark and \'(single quotation mark)
 - An arbitrary Unicode scalar value, written as \u{n}, where n is a 1-8 digit hexadecimal number
 */

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

// Initalizing an Empty String

var emptyString = "" // empty string literal
var anotheremptyString = String() //initilizer syntax
// these two strings ar both empty, and are equivalent to each other

if emptyString.isEmpty{
    print("Nothing to see here")
}

// String Mutablility

var variableString = "Horse"
variableString += " and carriage"
//variableString is now "Horse and carriage"

//let constantString = "Highlander"
//constantString += " and another Highlander
// this reports a compile-time error -a constant string cannot be modified

//Strings Are Value Types
/*Google Translation
 
 Swift의 String 유형은 값 유형입니다. 새 String 값을 만드는 경우 해당 String 값은 함수 나 메서드에 전달 될 때 또는 상수 또는 변수에 할당 될 때 복사됩니다. 각각의 경우 기존 String 값의 새 복사본이 만들어지고 원래 복사본이 아닌 새 복사본이 전달되거나 할당됩니다. 값 유형은 구조에서 설명하고 열거는 값 유형입니다.
 
 Swift의 copy-by-default String Behavior는 함수 나 메소드가 String 값을 전달할 때 그것이 어디서 왔는지에 관계없이 정확한 String 값을 소유하고 있음을 보증합니다. 전달한 문자열은 직접 수정하지 않으면 수정되지 않는다고 확신 할 수 있습니다.
 
 Swift의 컴파일러는 문자열 사용을 최적화하여 실제 복사가 절대적으로 필요한 경우에만 수행합니다. 즉 문자열을 값 유형으로 사용할 때 항상 훌륭한 성능을 얻을 수 있습니다.
 */

// Working with Characters
for character in "Dog!🐶"{
    print(character)
}


// Concatenating Strings and Characters
//let string1 = "hello"
//let string2 = " there"
//var welcome = string1 + string2
//var instruction = "look over"
//let exclamationMark: Character = "!"
//welcome.append(exclamationMark)


let badStart = """
one
two
"""

let end = """
three
"""

print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)


//String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// Counting Characters

let unusualMenagerie = "Koala 🐨, snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before:greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy:0)
greeting[index]

//greeting[greeting.endIndex] // Error
//greeting.index(after: greeting.endIndex) // Error

// Inserting and Removing
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)

let range = welcome.index(welcome.endIndex, offsetBy:-6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)

//SubString
let _greeting = "Hello, world!"
let _index = _greeting.firstIndex(of: ",") ?? _greeting.endIndex
let beginning = _greeting[..<_index]
let newString = String(beginning)

//Comparing Strings

//String and

