import UIKit

// Inheritance

class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        
    }
}


let somveVehicle = Vehicle()

print("Vehicle \(somveVehicle.description)")


class Bicycle: Vehicle{
    var hasBeasket = false
}

let bicycle = Bicycle()
bicycle.hasBeasket = true
bicycle.currentSpeed = 15.0

print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBeasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")




class Train: Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")


// Overriding Property Observers
class AutometicCar: Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automaticCar = AutometicCar()
automaticCar.currentSpeed = 35.0
print("AutometicCar: \(automaticCar.description)")


