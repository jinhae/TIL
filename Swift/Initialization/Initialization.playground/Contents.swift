import UIKit

// Initialization

// Setting Initial Values for Stored Properties

//Initializers

//struct Fahrenheit {
//    var temperature: Double
//    init(){
//        temperature = 32.0
//    }
//}

//var f = Fahrenheit()
//print("The default temperature is \(f.temperature)")


// Default Property Values

struct Fahrenheit{
    var temperature = 32.0
}

// Customizing initialization

//Initialization Parameters

//struct Celsius{
//    var temperatureInCelsius: Double
//    init(fromFahenheit fahrenheit: Double){
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(fromKelvin kelvin:Double){
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//
//let boilingPointOfWater = Celsius(fromKelvin: 212.0)
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// Parameter Names and Argument Labels

struct Color{
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//let veryGreen = Color(0.0, 1.0, 0.0) // Error

// initializer Parameters Without Argument Labels

struct Celsius{
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init (_ celsius: Double){
        temperatureInCelsius = celsius
    }
}


// Optional Property Types

//class SurveyQuestion{
//    var text: String
//    var reponse: String?
//    init(text: String){
//        self.text = text
//    }
//    func ask(){
//        print(text)
//    }
//}
//
//let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
//cheeseQuestion.ask()
//cheeseQuestion.reponse = "Yes, I do like cheese."


//Assigning Constant Properties During Initialization

class SurveyQuestion{
    let text: String
    var reponse: String?
    init(text: String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.reponse = "Yes, I do like cheese."


// Default Initializers

class ShoppingListItem {
    var name : String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//Memberwise initializers for Structure Types

//struct Size{
//    var width = 0.0, height = 0.0
//}
//
//let twoByTwo = Size(width: 2.0, height: 2.0)

//Initializer Delegation for Value Types

struct Size{
    var width = 0.0, height = 0.0
}

struct Point{
    var x = 0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    init(){}
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y:2.0), size: Size(width: 5.0, height: 5.0))




class SuperClass{
    var prop_1 = 0
    
    init(prop_1: Int){
        self.prop_1 = prop_1
        
    }
    
    convenience init(){
        self.init(prop_1: 22)
    }
    
    convenience init(test: Int){
        self.init(prop_1: test)
    }
}

class SubClass: SuperClass{
    var subProp = 0
    init(){
        super.init(prop_1: 11)
        subProp = 20
    }
}

var t_1 = SubClass()
t_1.prop_1

var tt_1 = SuperClass(test: 40)

