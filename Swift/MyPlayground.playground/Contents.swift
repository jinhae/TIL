import UIKit
import Foundation



let greeting = "Guten Tag!"
greeting[greeting.startIndex]
//greeting[greeting.endIndex] // Error occur
//greeting.index(after:greeting.endIndex)
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy:7)
greeting[index]













var emptyString = ""

var anotherEmptyString = String()


if(emptyString.isEmpty){
    print("this is empty string")
}

var variableString = "Horse"
variableString += " and carriage"

for character in "Dog!🐶"{
    print(character)
}

let badStart = """
one
two

"""
let end = """
three
"""

print(badStart+end)



//Range Operator


// One-Sided Ranges
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[2...]{
    print(name)
}
print("-------")
for name in names[...2]{
    print(name)
}
print("--------")
for name in names[..<2]{
    print(name)
}

//Half-Open Rnage Operator
let count = names.count
for i in 0..<count{
    print("Person \(i + 1) is called \(names[i])")
}




//Closed Range Operator
for index in 1...5{
    print("\(index) times 5 is \(index * 5)")
}










let defaultColorName = "red"
var userDefaultColorName: String?
var ColorNameToUse = userDefaultColorName ?? defaultColorName



var customersInLine = ["Chris","Alex","Ewa","Barry","Daniella"]
print(customersInLine.count) // 5





let customerProvider = { customersInLine.remove(at: 0)}
print(customersInLine.count) // 5

print("Now serving \(customerProvider())")

print(customersInLine.count) // 4


func serve(customer customerProvider : @autoclosure () -> String){
    print("now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))



var customerProviders : [()->String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders{
    print("Now serving \(customerProvider())")
}


// 클로저를 클래스 외부에서 사용할 수 있도록 배열로 선언함.
var completionHandlers:[() -> Void] = []


func someFunctionWithEscapingClosure(completionHandler: @escaping ()->Void){
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoneEscapingClosure(closure:()->Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
            print("Activate")
        }
        
        someFunctionWithNoneEscapingClosure { x=200 }
    }
    
    deinit{
        print("deinit")
    }
}


let instance = SomeClass()
instance.doSomething()
print(instance.x) // 200

completionHandlers.first?()
print(instance.x) // 100














func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementByTen())
print(incrementBySeven())
print(incrementByTen())
print(incrementBySeven())
print(incrementByTen())
print(incrementBySeven())



let digitNames = [
    0 : "zero", 1: "One", 2: "Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six",7:"Seven",8:"Eight", 9:"Nine"
]

let numbers = [16, 58, 510]


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












func someFunctionThatTakesAClosure(closure:() -> Void){
    closure()
    // function body goes here
}

 // Here's how you call thos fucntion without using trailing closure
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

someFunctionThatTakesAClosure(){
    //trailling closure's body goes here
}









//테스트로 사용할 데이터
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


func backword(_ s1:String, _ s2:String) -> Bool {
    return s1.count < s2.count
}

var reversedNames = names.sorted(by: backword)

//reveredNames = names.sorted(by:{ (s1:String, s2:String) ->Bool in
//    return s1 > s2
//
//})

//reveredNames = names.sorted(by:{ s1, s2 in
//    return s1>s2
//})

//reversedNames = names.sorted(by: { s1, s2 in s1>s2})

reversedNames = names.sorted(by:>)

print(reversedNames.description)

//------------------------------------------------------------------------------

func someFuncion(){
    
}

class SomeClass{
    func someMethod(){
        
    }
}


for index in 0..<4{
    print("hello \(index)")
}
for _ in 0..<4{
    print("Hello")
}



func user(_ name:String, _ mobile:String, _ email:String){
    print("name : \(name), mobile : \(mobile), email : \(mobile)")
}

user("jinhae", "01012341234", "test@test.com")



public class Observable<ObservedType>{
    public typealias Observer = (_ observervale:Observable<ObservedType>, ObservedType) -> Void
    
    private var observers: [Observer]
    
    public var value: ObservedType? {
        didSet{
            if let value = value{
                notifyObservers(value)
            }
        }
    }
    
    public init (_ value:ObservedType? = nil){
        self.value = value
        observers = []
    }
    
    public func bind(observer:@escaping Observer){
        self.observers.append(observer)
    }
    
    private func notifyObservers(_ value:ObservedType){
        self.observers.forEach { [unowned self](observer) in
            observer(self, value)
        }
    }
}






class HTML{
    let tagName: String
    let defaultContent: String = "hello, world"
    var content: String?
    
    init(tagName: String){
        self.tagName = tagName
    }
    
//    func asHTML() -> String{
//        return "<\(self.tagName)> \(self.content ?? self.defaultContent) </\(self.tagName)>"
//    }
    
    lazy var asHTML: () -> String = { [unowned self] in
        return "<\(self.tagName)> \(self.content ?? self.defaultContent) </\(self.tagName)>"
    }
    
//    lazy var asHTML: () -> String = {[] in
//        return "<\(self.tagName)> \(self.content ?? self.defaultContent) </\(self.tagName)>"
//    }
    
    deinit{
        print("\(tagName) is deallocated")
    }
}

var h: HTML? = HTML(tagName: "h1")
print("\(h?.asHTML())")
h = nil











//Closure

class

let addOne = {[] (x:Int) -> Int in return x+1}
addOne(1)
//let addOne = {[] (x:Int) -> Int in x+1}




let squares = (1...10).map({x in return x})
print("\(squares.description)")


//클로저를 리턴하는 함수
//이 함수는 다른 함수의 integer를 반환한다.
func makeProducer(x:Int) -> (()->Int){
    let closure = { x } // 클로저로 x값을 받았다.
    return closure//클로저를 리턴
}

let three = makeProducer(x: 3)
let four = makeProducer(x: 4)

three()
four()

// 파라미터가 있는 클로저
let addInts = {(x:Int, y:Int) -> Int in
    return x+y
}

let result = addInts(3,4)

print("\(result)")

// 리턴 값과 파라미터가 없는 클로저
let sayHi = { print("Hello") }

sayHi()








//
//class Dog{
//    lazy var name = { () ->String in
//        return "Dooooog"
//    }
//
//    func printName(){
//        print("my name is \(name)")
//    }
//}
//
//
//let dog = Dog()
//
//dog.printName()

//var str = "Hello, playground"
//
//
//var myProperty = 5{
//    willSet {
//        print("Will set to \(newValue). It was previously \(myProperty)")
//    }
//
//    didSet {
//        print("Did set to \(myProperty). It was previously \(oldValue)")
//    }
//}
//
//myProperty = 1
//
//
//var myFontSize = 10{
//    willSet(newFontSize){
//        print("will set font to \(newFontSize). it was \(myFontSize)")
//    }
//
//    didSet(oldFontSize){
//        print("Did set font to \(myFontSize). it was \(oldFontSize)")
//    }
//}
//
// myFontSize = 20


