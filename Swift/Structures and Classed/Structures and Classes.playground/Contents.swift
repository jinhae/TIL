import Foundation


// Structures and Classes

// Definition Syntax

struct SomeStructure{
    
}

class SomeClass{
    
}

/*
        Whenever you define a new structure or class, you define a new Swift type. Give types UpperCamelCase names (such as SomeStructure and SomeClass here) to match the capitalization of standard Swift types (such as String, Int, and Bool). Give properties and methods lowerCamelCase names (such as frameRate and incrementCount) to differentiate them from type names.
 */

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//Structure and Class Instances

let someResolution = Resolution()
let someVideoMode = VideoMode()

//Accessing Properties

print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoModes is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//Memberwise Initializers for Structure Types

let vga = Resolution(width: 640, height: 480)


//Structures and Enumerations Are Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

hd


enum CompassPoint{
    case north, south, ease, west
    mutating func turnNorth(){
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")



//Class are reference types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRqte property of tenEighty is now \(tenEighty.frameRate)")

//Identity Operator

//Identical to (===)
//Not identical to (!==)

if tenEighty === alsoTenEighty{
    print("tenEighty and alsoTenEight refer to ther smae VideoMode instance.")
}
