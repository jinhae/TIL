import UIKit

//Enumeration Syntax

//다중케이스 선언이 한줄에 가능하다. 콤마로 구분한다.
enum planet{
    case mercury, venus, earth, mars, jupiter, satrun, uranus, neptune
}

// Enum의 값들을 선언하는 방법. 앞에 case 키워드를 사용한다.
// 스위프트의 enum은 c와 objective c와 같은 언어와 달리 기본적으로 정수값을 설정하지 않는다.
// 아래 예제에서 north, south, east, west 들은 정수타입의 값을 갖지 않고 그들 만의 고유 값을 갖는다.
enum CompassPoint{
    case north
    case south
    case east
    case west
}

var directionToHead = CompassPoint.west
directionToHead = .north

// Matching Enumeration Values with a Swithch Statement
directionToHead = .south

switch directionToHead{
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("where the sun rises")
case .west:
    print("Where the skies are blue")
}

// Iterating over Enumeration Cases

enum Beverage: CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices)")

for beverage in Beverage.allCases{
    print(beverage)
}


// Associated Values
/*
 Swift의 enum은 특정 유형의 관련된 값들을 저장할 수 ㅣㅆ으며, 값 유형은 필요할경우 열거형의 각 사례마다 다룰수 있다.
 이러한 것과 유사한 열거 형은 구분된 공용체, 태그 지정된 공용체, 또는 다른 프로그래밍 언어의 변형이라고도 한다.
 */

enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// 연관 값 열거형에서 switch문 사용 방법
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code : \(productCode)")
}


let numberSystem: Int = 8
let manufacturer: Int = 85909
var product: Int = 51226
var check: Int = 3

var productCode = "ABCDEFGHIJKLNOP"

// 외부 variable 사용 가능
switch productBarcode {
case .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(productCode):
    print("QR code : \(productCode)")
case .upc(_, _, _, _):
    print("other upc type")
case .qrCode(_):
    print("other qr type")
}

// Raw Value
enum ASSCIIControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Word:String{
    case apple = "Apple"
    case Peach = "Peach"
    case Panana = "Banana"
}

let word = Word.apple

if word.rawValue == "Apple"{
    print("equal")
}


// Implicitly Assigned Raw Values

// mercury가 1의 값을 가지면 그 뒤로 2, 3으로 초기화 되어 값이 들어간다.
enum _Planet: Int, CaseIterable{
    case mercury = 1, venus, earth, mars, jupter, saturn, uranus, neptune
}

for planet in _Planet.allCases{
    print(planet.rawValue)
}

// north는 "north" 값이 raw value로 들어간다.
enum _CompassPoint: String, CaseIterable{
    case north, south, east, west
}

for compassPoint in _CompassPoint.allCases{
    print(compassPoint.rawValue)
}


// Initializing from a Raw Value
let possiblePlanet = _Planet(rawValue: 7)


let positionToFind = 11
if let somePlanet = _Planet(rawValue: positionToFind){
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a sage place for humans")
    }
}else{
    print("There isn't a planet at position \(positionToFind)")
}

//Recursive Enumertaions
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
//indirect enum ArithmeticExpression{
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let _product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int{
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left,right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(_product))
