import UIKit




//Check API Availablility

if #available(iOS 10, macOS 10.12, *){
    print("available")
}else{
    print("impossible")
}



//Early Exit
func greet(person:[String:String]){
    guard let name = person["name"] else{
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else{
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name" : "john"])

greet(person: ["name":"Jane", "location" : "Cupertino"])




//Labeled Statements
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare{
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}
print("game over!!")







// Fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2,3,5,6,11,13,17,19:
    description += " a prinumber, and also"
    fallthrough
default:
    description += " an integer."
}

print(description)






// Switch


// Compound cases

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}



let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter)is consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}







// Where
let yetAnotherPoint = (1, -1)
//let yetAnotherPoint = (1, 1)
//let yetAnotherPoint = (1, 2)
switch yetAnotherPoint{
case let(x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let(x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}



// Value Bindings
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on ther y-axis with an y value of \(y)")
case let (x,y):
    print("somewhere else at (\(x), \(y))")
}



//Tuples
let somePoint = (0, 0)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) in outside of the box")
}



//Interval Matching
let approximateCount: Int = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String?

switch approximateCount{
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 1..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There ar \(naturalCount!) \(countedThings)")





// No Implicit Fallthrough
let anotherCharacter:Character = "a"
switch anotherCharacter{
//case "a": // Invalid, the case has an empty
case "a","A":
//case "A":
    print("The letter A")
default:
    print("Not the letter")
}


//let someCharacter: Character = "z"
//
//switch someCharacter{
//case "a":
//    print("The first letter of the aplhabet")
//case "z":
//    print("The last letter of the alphabet")
//default:
//    print("Some other character")
//}









// While
//let finalSquare = 25
//var board = [Int](repeating: 0, count: finalSquare + 1)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//
//var square = 0
//var diceRoll = 0
while square < finalSquare{
    //roll the dice
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    // move by the rolled amount
    square += diceRoll
    if square < board.count{
        square += board[square]
    }
}








// For-In Loops

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider" : 8, "ant": 6, "cat" : 4]
for (animalName, legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5{
    print("\(index) time 5 is \(index*5)")
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power{
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


let minutes = 60
for tickMark in 0..<minutes{
    print(tickMark)
}

let minuteInterval = 5

for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, to: hours, by: hourInterval){
    print(tickMark)
}

