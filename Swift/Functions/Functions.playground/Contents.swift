import UIKit

//Defining anc Calling Functions

func greet(person: String) -> String{
    let greeting  = "Heelo, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String{
    return "Hello again, " + person + "!"
}


print(greet(person: "Anna"))
print(greet(person: "Brian"))

// Function Parameters and Return Values

//Function Without Parameters

func sayHello() -> String{
    return "hello, world"
}

print(sayHello())

//Function With Multiple Parameters
func greet(person: String, aleadyGreeted: Bool) -> String{
    if aleadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

print(greet(person:"Time", aleadyGreeted: true))


//Functions Without Return Values
func _greet(person: String){
    print("Hello, \(person)")
}

_greet(person: "Dave")


func printAndCount(string:String) -> Int{
    print(string)
    return string.count
}

func printWithoutCouning(string:String){
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, world")

printWithoutCouning(string: "Hello, world")

// Functions with Multiple Return Values
// Optional Tuple Return Types
func minMax(array:[Int]) -> (min: Int, max: Int)?{
    if array.isEmpty{return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        } else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [6,-6,2,109,3,71])
print("min is \(bounds!.min) and max is \(bounds!.max)")


//Function Argument Labels and Parameter Names

func someFunction(firstParameterName: Int, secondParameterName: Int){
    
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//Spectifying Argument Labels

func someFunction(argumentLabel parameterName:Int){
    //In the function body, parameterName refers to the argumentvalue
    // for that parameter
}

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! glad you could visit form \(hometown)."
}

print(greet(person:"Biil", from:"Cupertino"))

// Omitting Argument Labels
func someFunction(_ firstParameter: Int, secondParameterName: Int){
    
}

someFunction(1, secondParameterName: 2)


// Default Parameter Values

func _someFucntion(parameterWithoutDefault: Int, parameterWithDefault: Int = 12){
    print(parameterWithoutDefault)
    print(parameterWithDefault)
}

_someFucntion(parameterWithoutDefault: 3, parameterWithDefault:6)
_someFucntion(parameterWithoutDefault: 7)


// Variadic Parameters

func arithmeticMean(_ numbers: Double...) -> Double{
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)

arithmeticMean(3, 8.25, 18.75)

// In-Out

func swapTwoInts(_ a: inout Int, _ b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)


//Function Types

func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a * b
}

func printHelloworld(){
    print("hello, world")
}

// Using Function Types

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts

let anotherMathFunction = addTwoInts


print("Result: \(mathFunction(2,3))")


// Function Types as Parameter Types

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3,5)

//// Function Types as Return Types
//
//func stepForward(_ input: Int) -> Int{
//    return input + 1
//}
//
//func stepBackward(_ input: Int) -> Int {
//    return input - 1
//}
//
//func chooseStepFunction(backward: Bool)-> (Int) -> Int{
//    return backward ? stepBackward : stepForward
//}


// Nested Function
func chooseStepFunction(backward:Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward: stepForward
}



var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero")
while currentValue != 0{
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

print("zero!!")


//Finish
//Commit Test
//Why....
// Changed


