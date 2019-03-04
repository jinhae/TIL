import UIKit

//class Person{
//    var residence: Residence?
//}
//
//class Residence{
//    var numberOfRooms = 1
//}
//
//let john = Person()
//john.residence = Residence()
//
////let roomCount = john.residence?.numberOfRooms
//
//if let roomCount = john.residence?.numberOfRooms{
//    print("John's residence has \(roomCount) room(s)")
//}else{
//    print("Unable to retrieve the number of rooms")
//}

// Defining Model Classes for Optional Chanining
class Person{
    var residence: Residence?
}


class Residence{
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room{
    let name: String
    init(name: String) { self.name = name}
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String?{
        if let buildingNumber = buildingNumber, let street = street{
            return "\(buildingNumber) \(street)"
        }else if buildingName != nil{
            return buildingName
        }else{
            return nil
        }
    }
}


// Accessing Properties Through Optional Chaining

let john = Person()

if let rommCount = john.residence?.numberOfRooms{
    print("John's residence has \(rommCount) rooms")
} else {
    print("Unable to retieve the number of rooms")
}

func createAddress() -> Address {
    print("Function was called")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    if (john.residence?.address = someAddress) != nil{
        print("It was possible to set the address.")
    } else {
        print("It was not possible to set the address.")
    }
    return someAddress
}

john.residence?.address = createAddress()

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

john.residence?[0] = Room(name: "Bathroom")



let johnHouse = Residence()
johnHouse.rooms.append(Room(name: "Lining Room"))
johnHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("unable to retrieve the first room name.")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
if (testScores["Brian"]?[0] = 72) != nil {
    print("not nil")
} else {
    print("Unable to retrieve the testScore")
}

let johnAddress = Address()
johnAddress.buildingName = "The Larches"
johnAddress.street = "Laurel Street"
john.residence?.address = johnAddress

if let johnStreet = john.residence?.address?.street{
    print("John's street name is \(johnStreet).")
} else {
    print("Unable to retrieve the address")
}

if let buildingIdentifier = john.residence?.address?.buildingIdentifier(){
    print("John's building identifier is \(buildingIdentifier)")
}


if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The"){
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does no begin with \"The\".")
    }
}
