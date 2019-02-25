import UIKit


//Autoclosures --------------------------------------------------------

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

//let customerProvider = { customersInLine.remove(at: 0)}
//print(customersInLine.count)

//print("Now serving \(customerProvider())!")

customersInLine = ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String){
    print("Now serving \(customerProvider())")
}
serve(customer: {customersInLine.remove(at: 0)})


func serve_(customer customerProvider: @autoclosure () -> String){
    print("Now serving \(customerProvider())")
}
serve_(customer: customersInLine.remove(at: 0))

var customerProviders: [ ()->String ] = []
func collectCustomerProvider(_ customerProvider: @autoclosure @escaping () -> String){
    customerProviders.append(customerProvider)
}

collectCustomerProvider(customersInLine.remove(at: 0))
collectCustomerProvider(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders{
    print("New Serving \(customerProvider())")
}





print(customersInLine.count)

//Escaping Closures-------------------------------------------

var completionHandlers: [ ()->Void ] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoneEscapingClosure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 0
    func doSomeThing(){
        someFunctionWithEscapingClosure {  self.x = 100   }
        someFunctionWithNoneEscapingClosure { x = 200     }
    }
}

let instance = SomeClass()
instance.doSomeThing()
print(instance.x)

completionHandlers.first?()
print(instance.x)




// Capturing Values-----------------------------------------------

func makeIncrementer(forIncrement amount: Int) -> () -> Int{
    var runningTotal = 0
    
    func incrementer() -> Int{
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)

incrementBySeven()
incrementBySeven()
incrementBySeven()

// Closure Are Reference Types
let incrementerByFive = makeIncrementer(forIncrement: 5)
let cp_incrementerByFive = incrementerByFive
let cpcp_incrementerByFive = incrementerByFive

incrementerByFive()
cp_incrementerByFive()
cpcp_incrementerByFive()






//Trailing Closures
func someFunctionThatTakesAClosure(Closure: () -> Void){
    // function body goes here
}

// Here's how you call thos function without using a trailing closure:
someFunctionThatTakesAClosure(Closure: {
    // closure's body goes here
})

//Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure {
    // trailing closure's body goes here
}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six",  7: "Seven", 8: "Eight", 9:"Nine"
]

let numbers = [ 16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0

    return output
}
print(strings)

// Closure Expression Syntax ---------------------------------------------
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted{ (s1, s2) -> Bool in
    return s1 > s2
}

// Inferring Type From Context
reversedNames = names.sorted{ s1, s2 in
    return s1 > s2
}

// Implicit Return from Single-Expression Closure & Trailing Closure
reversedNames = names.sorted{s1, s2 in s1>s2}

// Shorthand Argument Names & Trailing Closure
reversedNames = names.sorted{ $0 > $1 }

// Operation Method
reversedNames = names.sorted(by: >)
